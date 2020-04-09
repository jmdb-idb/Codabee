//
//  RootController.swift
//  Codabee
//
//  Created by Jean-Michel De Bosschere on 08/04/2020.
//  Copyright © 2020 IDB. All rights reserved.
//

import UIKit
import InteractiveSideMenu


class RootController: MenuContainerViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Transition
        transitionOptions = TransitionOptions(duration: 0.4, visibleContentWidth: 60)
        
        // MenuController
        if  let menu  = getInitial(string: "Menu") as? MenuViewController {
            menuViewController = menu
        }
        
        // Contenu
        contentViewControllers = [
            getInitial(string: "Actus"),
            getInitial(string: "Videos"),
            getInitial(string: "Forum")
        ]
        
        
        // Sélectionner le 1er du contenu comme visible au départ
        if contentViewControllers.count > 0 {
            selectContentViewController(contentViewControllers.first!)
        }
    }
    
    func getInitial(string: String) -> UIViewController {
        let storyboard = UIStoryboard(name: string, bundle: nil)
        return storyboard.instantiateInitialViewController() ?? UIViewController()
    }
}
