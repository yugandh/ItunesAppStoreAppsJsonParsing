//
//  ItunesViewModel.swift
//  ItunesAppstoreAppsJsonParsing
//
//  Created by Yugandhar Kommineni on 8/11/19.
//  Copyright © 2019 Yugandhar Kommineni. All rights reserved.
//

import Foundation

class AlbumViewModel {
    // Variables
    var restApiManager = RestApiManager()
    var albumDataSource = ItunesAlbumJsonModel()
    typealias completionHandler = (ItunesAlbumJsonModel) -> ()
    
    // network call
    func itunesNetworkCall(completionHandler: @escaping completionHandler) {
        restApiManager.fetchData { [weak self]
            (albumResults) in
            self?.albumDataSource = albumResults
            completionHandler(albumResults)
        }
    }
    
    func getNumberOfRows() -> Int {
        return albumDataSource.feed?.results?.count ?? 0
    }
}
