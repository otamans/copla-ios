//
//  InitialCoordinator.swift
//  Copla
//
//  Created by Anton Yereshchenko on 6/17/18.
//  Copyright © 2018 Anton Yereshchenko. All rights reserved.
//

import UIKit

class InitialCoordinator: NSObject, Coordinator {
    
    var navigationController: UINavigationController
    
    required init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let auth = AuthorizationCoordinator.init(with: self.navigationController)
        auth.start()
    }
    
    func stop() {
        
    }
    
}
