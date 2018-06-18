//
//  UIViewController.swift
//  Copla
//
//  Created by Anton Yereshchenko on 6/17/18.
//  Copyright © 2018 Anton Yereshchenko. All rights reserved.
//

import UIKit

let storyboardName: String = "Main"

extension UIViewController {
    
    static func loadFrom(storyboard: String, id: String) -> UIViewController {
        return UIStoryboard(name: storyboard, bundle: nil).instantiateViewController(withIdentifier: id)
    }
    
}
