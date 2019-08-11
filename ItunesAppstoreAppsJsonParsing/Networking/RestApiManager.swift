//
//  RestApiManager.swift
//  ItunesAppstoreAppsJsonParsing
//
//  Created by Yugandhar Kommineni on 8/11/19.
//  Copyright © 2019 Yugandhar Kommineni. All rights reserved.
//

import Foundation

class RestApiManager {

    typealias completionBlock = (ItunesAlbumJsonModel) -> ()
    
    func fetchData(completionBlock: @escaping completionBlock) {
        guard let appStoreUrl = URL(string: "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/10/explicit.json") else { return }
        URLSession.shared.dataTask(with: appStoreUrl) { (data, response
            , error) in
            DispatchQueue.main.async {
                guard let data = data else { return }
                do {
                    let decoder = JSONDecoder()
                    
                    let userArray = try decoder.decode(ItunesAlbumJsonModel.self, from: data)
                    
                    completionBlock(userArray)
                    
                    print(userArray)
                } catch let err {
                    print("Err", err)
                }
            }
            }.resume()
    }
}

