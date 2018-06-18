//
//  RegistrationViewController.swift
//  Copla
//
//  Created by Anton Yereshchenko on 6/17/18.
//  Copyright © 2018 Anton Yereshchenko. All rights reserved.
//

import UIKit

protocol RegistrationViewControllerDelegate {
    func registration(with authorization: Authorization)
    func wrongRegistrationData()
}

class RegistrationViewController: UIViewController, UITextFieldDelegate {

    var delegate: RegistrationViewControllerDelegate?
    
    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var registrationButton: ActionButton!
    
    static let id: String = "RegistrationViewControllerIdentifier"
    static func controller() -> RegistrationViewController {
        return UIViewController.loadFrom(storyboard: storyboardName, id: id) as! RegistrationViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Регистрация"
        self.login.delegate = self
        self.password.delegate = self
        self.confirmPassword.delegate = self
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.login.resignFirstResponder()
        self.password.resignFirstResponder()
        self.confirmPassword.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if touch.view == self.view || touch.view == self.registrationButton {
                self.login.resignFirstResponder()
                self.password.resignFirstResponder()
                self.confirmPassword.resignFirstResponder()
            }
        }
    }
    
    @IBAction func registrationButtonTapped(_ sender: Any) {
        let authorization = Authorization(login: self.login.text!,
                                        password: self.password.text!,
                                        confirmPassword: self.confirmPassword.text!)
        
        if authorization.isRegistrationValid() {
            self.delegate?.registration(with: authorization)
        } else {
            self.delegate?.wrongRegistrationData()
        }
    }
    
}
