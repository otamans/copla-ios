//
//  Service.swift
//  Copla
//
//  Created by Anton Yereshchenko on 6/18/18.
//  Copyright © 2018 Anton Yereshchenko. All rights reserved.
//

import UIKit

struct Service : Codable {
    
    var name: String?
    var description: String?
    var owner: Int?
    var plan: Plans?
    var provide: Provide?
    var category: Category?
    var photo: String?
    var date: String?
    var time_coins: Int?
    var photo_data: Data?
    
    func getDate() -> Date? {
        if let date = self.date {
            let isoFormatter = ISO8601DateFormatter()
            return isoFormatter.date(from: date)!
        }
        return nil
    }
    
}
