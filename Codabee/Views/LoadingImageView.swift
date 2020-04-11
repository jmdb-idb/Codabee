//
//  LoadingImageView.swift
//  Codabee
//
//  Created by Jean-Michel De Bosschere on 11/04/2020.
//  Copyright © 2020 IDB. All rights reserved.
//

import UIKit

class LoadingImageView: UIImageView {
    
    var timer = Timer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
       image = UIImage(named: "darkBee")
        contentMode = .scaleAspectFit
    }
    
    func start() {
         timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { (t) in
             UIView.transition(with: self, duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
         })
     }
     

    func stop() {
        timer.invalidate()
    }
    
    
}
