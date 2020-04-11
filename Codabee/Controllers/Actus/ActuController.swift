//
//  ActuController.swift
//  Codabee
//
//  Created by Jean-Michel De Bosschere on 08/04/2020.
//  Copyright © 2020 IDB. All rights reserved.
//

import UIKit
import InteractiveSideMenu


class ActuController: UITableViewController, SideMenuItemContent {

    var articles: [Article ] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Actualités"
        tableView.setup(color: HONEY_COLOR)
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(parse), for: .valueChanged)
        parse()
    }
    
    @objc func parse() {
        
        RSSParser().parse(CODABEE_FEED){ (art) in
            DispatchQueue.main.async {
                self.articles = art
                print ("Articles count : \(self.articles.count)")
                self.tableView.reloadData()
                if self.tableView.refreshControl?.isRefreshing ?? false {
                    self.tableView.refreshControl?.endRefreshing()
                }
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return articles.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell") as? ArticleCell {
            cell.setup(articles[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let urlString = articles[indexPath.row].link
        performSegue(withIdentifier: "Detail", sender: urlString)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Detail" {
            if let controller = segue.destination as? WebController {
                controller.urlString = sender as? String
                
            }
        }
    }


    @IBAction func showMenu(_ sender: Any) {
        showSideMenu()
    }
}
