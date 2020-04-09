//
//  Nav.swift
//  Codabee
//
//  Created by Jean-Michel De Bosschere on 09/04/2020.
//  Copyright © 2020 IDB. All rights reserved.
//

import UIKit

class Nav: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.barTintColor = .darkGray
        navigationBar.tintColor = HONEY_COLOR
        navigationBar.titleTextAttributes = [
            .foregroundColor: HONEY_COLOR,
            .font: UIFont.italicSystemFont(ofSize: 20)
        ]
    }
    

}
