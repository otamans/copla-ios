//
//  Authorization.swift
//  Copla
//
//  Created by Anton Yereshchenko on 6/17/18.
//  Copyright © 2018 Anton Yereshchenko. All rights reserved.
//

import Foundation

struct Authorization {
    
    var login: String
    var password: String
    var confirmPassword: String?
    
    init(login: String, password: String, confirmPassword: String?) {
        self.login = login
        self.password = password
        self.confirmPassword = confirmPassword
    }
    
    func isRegistrationValid() -> Bool {
        return self.login.count > 0 && self.password.count > 0 && self.isPasswordsEqual()
    }
    
    func isLoginValid() -> Bool {
        return self.login.count > 0 && self.password.count > 0
    }
    
    private func isPasswordsEqual() -> Bool {
        return self.password == self.confirmPassword
    }
    
}
