//
//  MenuController.swift
//  Codabee
//
//  Created by Jean-Michel De Bosschere on 08/04/2020.
//  Copyright © 2020 IDB. All rights reserved.
//

import UIKit
import InteractiveSideMenu


class MenuController: MenuViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var items = ["Fil d'actualité", "Vidéos", "Forum"]
        

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        tableView.delegate = self
        tableView.dataSource = self
        tableView.setup()
        
    }
    
}


extension MenuController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuContainerViewController?.contentViewControllers.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell") as? MenuCell {
            cell.setup(items[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let main = menuContainerViewController { main.selectContentViewController(main.contentViewControllers[indexPath.row])
            main.hideSideMenu()
        }
    }
    
}
