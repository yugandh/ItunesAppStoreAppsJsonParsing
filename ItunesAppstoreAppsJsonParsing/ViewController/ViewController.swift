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
    var albumViewModel = AlbumViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        albumViewModel.itunesNetworkCall { (user) in
            
            DispatchQueue.main.async {
                self.albumsTableView.delegate = self
                self.albumsTableView.dataSource = self
                self.albumsTableView.reloadData()
            }
            
        }
       
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//         super.viewWillAppear(animated)
//        albumsTableView.delegate = self
//        albumsTableView.dataSource = self
//        albumsTableView.reloadData()
//    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumViewModel.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: "yug", for: indexPath) as? ItunesAlbumTableViewCell  else {
            return UITableViewCell()
        }

        
        if let artistLabel = albumViewModel.albumDataSource.feed?.results![indexPath.row] {
                        cell.artistNameLabel.text = artistLabel.artistName
                        cell.copyrightLabel.text = artistLabel.copyright
                        cell.appsImageView.downloadedFrom(link: artistLabel.artwork_Url!)
        }

        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
}

