//
//  WebController.swift
//  Codabee
//
//  Created by Jean-Michel De Bosschere on 11/04/2020.
//  Copyright © 2020 IDB. All rights reserved.
//

import UIKit
import WebKit

class WebController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    var urlString: String?
    var loadingIV: LoadingImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let link = urlString, let url = URL(string: link) else { return }
        let urlRequest = URLRequest(url: url)
        webView.navigationDelegate = self
        // Création animation
        loadingIV = LoadingImageView(frame: CGRect(x: view.frame.width / 2 - 75, y: 75, width: 150, height: 150))
        loadingIV?.start()
        if loadingIV != nil {
            view.addSubview(loadingIV!)
        }
        
        webView.load(urlRequest)
    }
    
}

extension WebController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loadingIV?.stop()
        loadingIV?.removeFromSuperview()
        loadingIV = nil
    }
}
