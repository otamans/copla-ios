//
//  ServicesQuerying.swift
//  Copla
//
//  Created by Anton Yereshchenko on 6/18/18.
//  Copyright © 2018 Anton Yereshchenko. All rights reserved.
//

import UIKit

class ServicesQuerying: NSObject {

    static func advertisements(services: [Service]) -> [Service] {
        return services.filter({ (service) -> Bool in
            return service.plan == .ad
        })
    }
    
    static func services(services: [Service]) -> [Service] {
        var services = self.servicesWithoutAd(services: services)
        services.sort { (s1, s2) -> Bool in
            return (s1.plan?.rawValue)! > (s2.plan?.rawValue)!
        }
        return services
    }
    
    private static func servicesWithoutAd(services: [Service]) -> [Service] {
        return services.filter({ (service) -> Bool in
            return service.plan != .ad
        })
    }
    
}
