//
//  MainCoordinator.swift
//  Copla
//
//  Created by Anton Yereshchenko on 6/17/18.
//  Copyright © 2018 Anton Yereshchenko. All rights reserved.
//

import UIKit

class MainCoordinator: NSObject, Coordinator, ServicesViewControllerDelegate, ServiceViewControllerDelegate {

    var navigationController: UINavigationController

    required init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = ServicesViewController.controller()
        controller.delegate = self
        self.navigationController.pushViewController(controller, animated: true)
    }
    
    func stop() {
        
    }
    
    // MARK: ServicesViewControllerDelegate
    
    func controllerWillShow(controller: ServicesViewController) {
        NetworkService.services { (services, error) in
            DispatchQueue.main.async {
                controller.setServices(services: services)
            }
        }
    }
    
    func openFilters(controller: ServicesViewController) {
        let controller = FiltersViewController.controller()
        self.navigationController.pushViewController(controller, animated: true)
    }
    
    func selectItem(service: Service) {
        let controller = ServiceViewController.controller()
        controller.delegate = self
        controller.service = service
        self.navigationController.pushViewController(controller, animated: true)
    }
    
    // MARK: ServiceViewControllerDelegate
    
    func acceptDidClick(controller: ServiceViewController) {
        
    }
    
    func closeDidClick(controller: ServiceViewController) {
        self.navigationController.popViewController(animated: true)
    }

}
