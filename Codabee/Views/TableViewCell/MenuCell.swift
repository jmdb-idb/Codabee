//
//  MenuCell.swift
//  Codabee
//
//  Created by Jean-Michel De Bosschere on 09/04/2020.
//  Copyright © 2020 IDB. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    
    func setup(_ string: String) {
        self.setup()
        nameLbl.text = string
    }

}


