//
//  ViewController.swift
//  ItunesAppstoreAppsJsonParsing
//
//  Created by Yugandhar Kommineni on 7/17/18.
//  Copyright © 2018 Yugandhar Kommineni. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var albumsTableView: UITableView!

    var albulmResults: ItunesAlbumJsonModel? {
        didSet {
            albumsTableView.delegate = self
            albumsTableView.dataSource = self
            albumsTableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }

    func fetchData() {
        guard let appStoreUrl = URL(string: "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/10/explicit.json") else { return }
        URLSession.shared.dataTask(with: appStoreUrl) { (data, response
            , error) in
            DispatchQueue.main.async {
                guard let data = data else { return }
                do {
//                    let jsonResponse = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    
                    let decoder = JSONDecoder()
                    
                    self.albulmResults = try decoder.decode(ItunesAlbumJsonModel.self, from: data)
                } catch let err {
                    print("Err", err)
                }
            }
            }.resume()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (albulmResults?.feed?.results?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: "yug", for: indexPath) as? ItunesAlbumTableViewCell  else {
            return UITableViewCell()
        }

        if let artistLabel = albulmResults?.feed?.results![indexPath.row] {
            cell.artistNameLabel.text = artistLabel.artistName
            cell.copyrightLabel.text = artistLabel.copyright
            cell.appsImageView.downloadedFrom(link: artistLabel.artwork_Url!)
        }

        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
}

