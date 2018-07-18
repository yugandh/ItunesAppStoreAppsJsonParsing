//
//  ItunesAlbumJsonModel.swift
//  ItunesAppstoreAppsJsonParsing
//
//  Created by Yugandhar Kommineni on 7/17/18.
//  Copyright © 2018 Yugandhar Kommineni. All rights reserved.
//

import Foundation

struct ItunesAlbumJsonModel: Codable {
    var feed: Feed?
}

struct Feed: Codable {
    var results: [Result]?
}

struct Result: Codable {
    let artistName: String?
    let id: String?
    let name: String?
    let copyright: String?
    let artwork_Url: String?

    private enum CodingKeys: String, CodingKey {
        case artistName, id, name, copyright
        case artwork_Url = "artworkUrl100"
    }
}
