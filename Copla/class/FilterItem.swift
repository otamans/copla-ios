//
//  FilterItem.swift
//  Copla
//
//  Created by Anton Yereshchenko on 6/18/18.
//  Copyright © 2018 Anton Yereshchenko. All rights reserved.
//

import UIKit

class FilterItem: NSObject {

    var title: String
    var isHeader: Bool
    var numbers: Int
    
    init(title: String, isHeader: Bool, numbers: Int) {
        self.title = title
        self.isHeader = isHeader
        self.numbers = numbers
    }
    
}
