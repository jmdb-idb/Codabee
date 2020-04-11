//
//  ArticleCell.swift
//  Codabee
//
//  Created by Jean-Michel De Bosschere on 10/04/2020.
//  Copyright © 2020 IDB. All rights reserved.
//

import UIKit
import SDWebImage

class ArticleCell: UITableViewCell {

    @IBOutlet weak var articleIV: UIImageView!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var article: Article!
    
    func setup(_ article: Article) {
        self.article = article
        setup()
        titleLabel.text = self.article.title
        dateLbl.text = self.article.pubDate.ilYA()
        articleIV.download(string: self.article.imageUrl)
        
    }

}
