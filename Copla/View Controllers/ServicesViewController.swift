//
//  ServicesViewController.swift
//  Copla
//
//  Created by Anton Yereshchenko on 6/17/18.
//  Copyright © 2018 Anton Yereshchenko. All rights reserved.
//

import UIKit

protocol ServicesViewControllerDelegate {
    func controllerWillShow(controller: ServicesViewController)
    func openFilters(controller: ServicesViewController)
    func selectItem(service: Service)
}

class ServicesViewController: UIViewController, AdvertisementsCellDataSourceDelegate, ServicesCellDataSourceDelegate {
    
    @IBOutlet weak var advertismentsView: UICollectionView!
    @IBOutlet weak var servicesView: UICollectionView!

    private var advertisementsDataSource: AdvertisementsCellDataSource?
    private var servicesDataSource: ServicesCellDataSource?
    
    var services: [Service] =  [Service]()
    
    var delegate: ServicesViewControllerDelegate?
    
    static let id: String = "ServicesViewControllerIdentifier"
    static func controller() -> ServicesViewController {
        return UIViewController.loadFrom(storyboard: storyboardName, id: id) as! ServicesViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        self.title = "Услуги"
        
        let rightBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "FilterImage"), style: .done, target: self, action: #selector(filterDidTapped(sender:)))
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        
        self.advertisementsDataSource = AdvertisementsCellDataSource(with: self.advertismentsView)
        self.advertisementsDataSource?.advertisementsDelegate = self
        self.servicesDataSource = ServicesCellDataSource(with: self.servicesView)
        self.servicesDataSource?.servicesDelegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.delegate?.controllerWillShow(controller: self)
    }
    
    func setServices(services: [Service]) {
        self.services = services
        self.advertisementsDataSource?.items = ServicesQuerying.advertisements(services: services)
        self.servicesDataSource?.items = ServicesQuerying.services(services: services)
        self.advertismentsView.reloadData()
        self.servicesView.reloadData()
    }
    
    @objc func filterDidTapped(sender: Any) {
        self.delegate?.openFilters(controller: self)
    }
    
    // MARK: AdvertisementsCellDataSourceDelegate, ServicesCellDataSourceDelegate
    
    func didSelect(item: Service) {
        self.delegate?.selectItem(service: item)
    }

}
