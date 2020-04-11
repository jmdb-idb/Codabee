//
//  Extension UI.swift
//  Codabee
//
//  Created by Jean-Michel De Bosschere on 09/04/2020.
//  Copyright © 2020 IDB. All rights reserved.
//

import UIKit
import SDWebImage


extension UITableView {
    
    func setup(color: UIColor) {
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

extension UIImageView {
    
    func download(string: String) {
        sd_setImage(with: URL(string: string), placeholderImage: BUMBLE_IMAGE, options: SDWebImageOptions.highPriority, completed: nil)
    }

}
