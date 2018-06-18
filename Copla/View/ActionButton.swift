//
//  ActionButton.swift
//  Copla
//
//  Created by Anton Yereshchenko on 6/17/18.
//  Copyright © 2018 Anton Yereshchenko. All rights reserved.
//

import UIKit

class ActionButton: UIButton {
    
    override func awakeFromNib() {
        self.layer.cornerRadius = self.frame.height / 2
        self.backgroundColor = UIColor.actionBlue
        self.setTitleColor(UIColor.white, for: .normal)
    }

}
