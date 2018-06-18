//
//  ServiceCollectionViewCell.swift
//  Copla
//
//  Created by Anton Yereshchenko on 6/17/18.
//  Copyright © 2018 Anton Yereshchenko. All rights reserved.
//

import UIKit
import Alamofire

class ServiceCollectionViewCell: UICollectionViewCell {

    var isAdvertisement: Bool = false
    
    @IBOutlet weak var progress: UIActivityIndicatorView!
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var adHeight: NSLayoutConstraint!
    @IBOutlet weak var adView: UIView!
    @IBOutlet weak var points: UILabel!
    @IBOutlet weak var imageType: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    static func nib() -> UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if self.isAdvertisement {
            self.adHeight.constant = 8
        } else {
            self.adHeight.constant = 0
        }
    }
    
    func initCell(service: Service) {
        if let title = service.name {
            self.title.text = title
        }
        if let points = service.time_coins {
            self.points.text = String(describing: points)
        }
        if let url = service.photo {
            self.progress.startAnimating()
            Alamofire.request(url, method: .get).response { (response) in
                DispatchQueue.main.async {
                    if let image = response.data {
                        self.backImage.image = UIImage(data: image)
                        self.progress.stopAnimating()
                    }  else {
                        self.progress.stopAnimating()
                    }
                }
            }
        }
        self.initPlanImage(plan: service.plan)
    }
    
    private func initGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = self.adView.bounds
        gradient.colors = [UIColor.orangeFrom.cgColor, UIColor.orangeTo.cgColor]
        self.adView.layer.insertSublayer(gradient, at: 0)
    }
    
    private func initPlanImage(plan: Plans?) {
        if plan == .ad {
            self.imageType.image = UIImage(named: "AdImage")
        } else if plan == .lock {
            self.imageType.image = UIImage(named: "LockImage")
        } else {
            self.imageType.image = nil
        }
    }
    
}
