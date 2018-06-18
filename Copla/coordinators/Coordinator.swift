//
//  Coordinator.swift
//  Copla
//
//  Created by Anton Yereshchenko on 6/17/18.
//  Copyright © 2018 Anton Yereshchenko. All rights reserved.
//

import UIKit

protocol Coordinator {
    
    init(with navigationController: UINavigationController)
    
    func start()
    func stop()
}
