//
//  InitialViewController.swift
//  Copla
//
//  Created by Anton Yereshchenko on 6/17/18.
//  Copyright © 2018 Anton Yereshchenko. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

    static let id: String = "InitialViewControllerIdentifier"
    static func controller() -> InitialViewController {
        return UIViewController.loadFrom(storyboard: storyboardName, id: id) as! InitialViewController
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
    }

}
