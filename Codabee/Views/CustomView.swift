//
//  CustomView.swift
//  Codabee
//
//  Created by Jean-Michel De Bosschere on 09/04/2020.
//  Copyright © 2020 IDB. All rights reserved.
//

import UIKit

class customView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        layer.cornerRadius = 15
        layer.borderWidth = 2
        layer.borderColor = HONEY_COLOR.cgColor
        backgroundColor = .darkGray
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: -4, height: 4)
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.65
        
    }
}
