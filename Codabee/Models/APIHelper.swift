//
//  APIHelper.swift
//  Codabee
//
//  Created by Jean-Michel De Bosschere on 11/04/2020.
//  Copyright © 2020 IDB. All rights reserved.
//

import UIKit

class APIHelper {
    
    func getVideos(completion: (([Video]) -> Void)?) {
        
        if var urlComponents = URLComponents(string: API_BASE_SEARCH) {
            urlComponents.queryItems = [
               URLQueryItem(name: "part", value: "snippet"),
               URLQueryItem(name: "channelId", value: CHANNEL_ID),
               URLQueryItem(name: "maxResults", value: String(50)),
               URLQueryItem(name: "type", value: "video"),
               URLQueryItem(name: "key", value: API_KEY)
            ]
            if let url = urlComponents.url {
                URLSession.shared.dataTask(with: url) { (d, response, error) in
                    if let data = d {
                        do {
                           let resultats =  try JSONDecoder().decode(APIResponse.self, from: data)
                            completion?(resultats.items)
                        } catch {
                            print(error.localizedDescription)
                            completion?([])
                        }
                    } else {
                        completion?([])
                    }
                }.resume()
            } else {
                completion?([])
            }
        } else {
            completion?([])
        }
    }
}
