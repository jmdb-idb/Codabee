//
//  VideoCell.swift
//  Codabee
//
//  Created by Jean-Michel De Bosschere on 11/04/2020.
//  Copyright © 2020 IDB. All rights reserved.
//

import UIKit
import SDWebImage

class VideoCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var thumb: UIImageView!
    
    var video: Video!
    
    func setup(_ video: Video) {
        self.video = video
        setup()
        titleLbl.text = self.video.snippet.title
        thumb.sd_setImage(with: URL(string: self.video.snippet.thumbnails.high.url), placeholderImage: BUMBLE_IMAGE, options: SDWebImageOptions.highPriority, completed: nil)
    }

}
