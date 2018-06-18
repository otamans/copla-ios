//
//  NetworkService.swift
//  Copla
//
//  Created by Anton Yereshchenko on 6/17/18.
//  Copyright © 2018 Anton Yereshchenko. All rights reserved.
//

import UIKit
import Alamofire

class NetworkService: NSObject {

    private static let url = "http://346e4e19.ngrok.io"
    
    private static let loginEndpoint = "\(url)/sign-in";
    private static let registrationEndpoint = "\(url)/sign-up";
    private static let servicesEndpoint = "\(url)/service";
    private static let profileEndpoint = "\(url)/profiles/%d/";

    static func login(auth: Authorization, completionHandler: @escaping (String?, String?) -> ()) {
        let parameters = ["username":auth.login, "password":auth.password]
        Alamofire.request(loginEndpoint, method: .post, parameters: parameters).responseJSON { (response) in
            switch response.result {
            case .success(let JSON):
                let response = JSON as! NSDictionary
                if let token = response.object(forKey: "token") as? String {
                    completionHandler(token, nil)
                } else {
                    if let key = response.allKeys.first {
                        if let messages = response.object(forKey: key) as? Array<Any> {
                            if let error = messages.first as? String {
                                completionHandler(nil, error)
                                return
                            }
                        }
                    }
                    completionHandler(nil, nil)
                }
                break
            case .failure(let error):
                completionHandler(nil, error.localizedDescription)
            }
        }
    }
    
    static func registration(auth: Authorization, completionHandler: @escaping (String?, String?) -> ()) {
        let parameters = ["username":auth.login, "password":auth.password]
        Alamofire.request(registrationEndpoint, method: .post, parameters: parameters).responseJSON { (response) in            
            switch response.result {
            case .success(let JSON):
                let response = JSON as! NSDictionary
                if let token = response.object(forKey: "token") as? String {
                    completionHandler(token, nil)
                } else {
                    if let key = response.allKeys.first {
                        if let messages = response.object(forKey: key) as? Array<Any> {
                            if let error = messages.first as? String {
                                completionHandler(nil, error)
                                return
                            }
                        }
                    }
                    completionHandler(nil, nil)
                }
                break
            case .failure(let error):
                completionHandler(nil, error.localizedDescription)
            }
        }
    }
    
    static func services(completionHandler: @escaping ([Service], String?) -> ()) {
        Alamofire.request(servicesEndpoint, method: .get).responseJSON { (response) in
            var services: [Service] = [Service]()
            switch response.result {
            case .success(let JSON):
                let response = JSON as! NSArray
                for item in response {
                    if let dictionary = item as? NSDictionary {
                        if let json = self.jsonString(from: dictionary) {
                            if let jsonData = json.data(using: .utf8) {
                                if let service = try? JSONDecoder().decode(Service.self, from: jsonData) {
                                    services.append(service)
                                }
                            }
                        }
                    }
                }
                completionHandler(services, nil)
                break
            case .failure(let error):
                completionHandler(services, error.localizedDescription)
            }
        }
    }
    
    static func loadPhoto(url: String, completionHandler: @escaping (Data?) -> ()) {
        Alamofire.request(url, method: .get).response { (response) in
            DispatchQueue.main.async {
                if let image = response.data {
                    completionHandler(image)
                } else {
                    completionHandler(nil)
                }
            }
        }
    }
    
    static func profile(id: Int, completionHandler: @escaping (Data?) -> ()) {
        Alamofire.request(servicesEndpoint, method: .get).responseJSON { (response) in
            switch response.result {
            case .success(let JSON):
                print(JSON)
                break
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private static func jsonString(from dictionary: NSDictionary) -> String? {
        let jsonData = try? JSONSerialization.data(withJSONObject: dictionary, options: [])
        return String(data: jsonData!, encoding: .utf8)
    }

}
