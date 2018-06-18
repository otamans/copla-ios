//
//  ServiceViewController.swift
//  Copla
//
//  Created by Anton Yereshchenko on 6/18/18.
//  Copyright © 2018 Anton Yereshchenko. All rights reserved.
//

import UIKit
import Alamofire

protocol ServiceViewControllerDelegate {
    func acceptDidClick(controller: ServiceViewController)
    func closeDidClick(controller: ServiceViewController)
}

class ServiceViewController: UIViewController {

    var service: Service?
    
    var delegate: ServiceViewControllerDelegate?
    
    @IBOutlet weak var backImage: UIImageView!
    
    @IBOutlet weak var isProvide: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var userRate: UILabel!
    
    static let id: String = "ServiceViewControllerIdentifier"
    static func controller() -> ServiceViewController {
        return UIViewController.loadFrom(storyboard: storyboardName, id: id) as! ServiceViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = self.service?.name

        if let provide = self.service?.provide {
            self.isProvide.text = provide == .sell ? "Получить" : "Предоставлять"
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = formatter.string(from: (self.service?.getDate())!)
        let date = formatter.date(from: dateString)
        formatter.dateFormat = "dd.MM"
        let formatString = formatter.string(from: date!)
        
        self.date.text = formatString
        if let point = self.service?.time_coins{
            self.pointsLabel.text = String(point)
        }
        self.titleLabel.text = self.service?.name
        self.descriptionTextView.text = self.service?.description
        
        if let photo = self.service?.photo {
            Alamofire.request(photo, method: .get).response { (response) in
                DispatchQueue.main.async {
                    if let image = response.data {
                        self.backImage.image = UIImage(data: image)
                    }
                }
            }
        }
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        self.delegate?.closeDidClick(controller: self)
    }
    
    @IBAction func acceptButtonTapped(_ sender: Any) {
        self.delegate?.acceptDidClick(controller: self)
    }
    
}
