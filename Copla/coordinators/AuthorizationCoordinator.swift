//
//  AuthorizationCoordinator.swift
//  Copla
//
//  Created by Anton Yereshchenko on 6/17/18.
//  Copyright © 2018 Anton Yereshchenko. All rights reserved.
//

import UIKit

class AuthorizationCoordinator: NSObject, Coordinator, RegistrationViewControllerDelegate, LoginViewControllerDelegate {

    var navigationController: UINavigationController
    
    required init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = LoginViewController.controller()
        controller.delegate = self
        self.navigationController.pushViewController(controller, animated: true)
    }
    
    func stop() {
        
    }
    
    // MARK: RegistrationViewControllerDelegate
    
    func registration(with registration: Authorization) {
        NetworkService.registration(auth: registration) { (token, error) in
            DispatchQueue.main.async {
                if token != nil {
                    self.navigationController.popToRootViewController(animated: true)
                    MainCoordinator(with: self.navigationController).start()
                } else {
                    if let error = error {
                        self.navigationController.warningAlert(message: error)
                    } else {
                        self.navigationController.warningAlert(message: "Ошибка при регистрации")
                    }
                }
            }
        }
    }
    
    func wrongRegistrationData() {
        self.navigationController.warningAlert(message: "Все поля должны быть заполнены и пароли должны совпадать")
    }
    
    func registration() {
        let controller = RegistrationViewController.controller()
        controller.delegate = self
        self.navigationController.pushViewController(controller, animated: true)
    }
    
    // MARK: LoginViewControllerDelegate

    func login(with authorization: Authorization) {
        NetworkService.login(auth: authorization) { (token, error) in
            DispatchQueue.main.async {
                if token != nil {
                    self.navigationController.popToRootViewController(animated: true)
                    MainCoordinator(with: self.navigationController).start()
                } else {
                    if let error = error {
                        self.navigationController.warningAlert(message: error)
                    } else {
                        self.navigationController.warningAlert(message: "Ошибка при логине")
                    }
                }
            }
        }
    }
    
    func wrongAuthorizationData() {
        self.navigationController.alert(with: "Ошибка", message: "Все поля должны быть заполнены")
    }
    
}
