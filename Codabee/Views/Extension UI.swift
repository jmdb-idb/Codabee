//
//  Extension UI.swift
//  Codabee
//
//  Created by Jean-Michel De Bosschere on 09/04/2020.
//  Copyright © 2020 IDB. All rights reserved.
//

import UIKit


extension UITableView {
    
    func setup() {
        backgroundColor = .clear
        separatorStyle = .none
        tableFooterView = UIView()
    }
}


extension UITableViewCell {
    
    func setup() {
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        selectionStyle = .none
    }
}
