//
//  LoginViewController.swift
//  Copla
//
//  Created by Anton Yereshchenko on 6/17/18.
//  Copyright © 2018 Anton Yereshchenko. All rights reserved.
//

import UIKit

protocol LoginViewControllerDelegate {
    func login(with authorization: Authorization)
    func wrongAuthorizationData()
    func registration()
}

class LoginViewController: UIViewController, UITextFieldDelegate {

    var delegate: LoginViewControllerDelegate?

    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginButton: ActionButton!
    @IBOutlet weak var registrationButton: UIButton!

    static let id: String = "LoginViewControllerIdentifier"
    static func controller() -> LoginViewController {
        return UIViewController.loadFrom(storyboard: storyboardName, id: id) as! LoginViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Логин"
        self.login.delegate = self
        self.password.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.login.resignFirstResponder()
        self.password.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if touch.view == self.view || touch.view == self.registrationButton {
                self.login.resignFirstResponder()
                self.password.resignFirstResponder()
            }
        }
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        let authorization = Authorization(login: self.login.text!,
                                          password: self.password.text!,
                                          confirmPassword: nil)
        if authorization.isLoginValid() {
            self.delegate?.login(with: authorization)
        } else {
            self.delegate?.wrongAuthorizationData()
        }
    }

    @IBAction func registrationButtonTapped(_ sender: Any) {
        self.delegate?.registration()
    }
    
}
