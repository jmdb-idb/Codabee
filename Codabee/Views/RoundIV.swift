//
//  RoundIV.swift
//  Codabee
//
//  Created by Jean-Michel De Bosschere on 10/04/2020.
//  Copyright © 2020 IDB. All rights reserved.
//

import UIKit

class RoundIV: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        clipsToBounds = true
        contentMode = .scaleAspectFill
        layer.cornerRadius = frame.height / 2
        layer.borderColor = HONEY_COLOR.cgColor
        layer.borderWidth = 2
        
    }
}
