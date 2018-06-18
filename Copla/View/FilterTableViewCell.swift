//
//  FilterTableViewCell.swift
//  Copla
//
//  Created by Anton Yereshchenko on 6/18/18.
//  Copyright © 2018 Anton Yereshchenko. All rights reserved.
//

import UIKit

class FilterTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var number: UILabel?

    func setItem(item: FilterItem) {
        self.title.text = item.title
        self.number?.text = String(item.numbers)
    }

}
