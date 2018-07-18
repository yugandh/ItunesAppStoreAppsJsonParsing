//
//  ItunesAlbumTableViewCell.swift
//  ItunesAppstoreAppsJsonParsing
//
//  Created by Yugandhar Kommineni on 7/17/18.
//  Copyright © 2018 Yugandhar Kommineni. All rights reserved.
//

import UIKit

class ItunesAlbumTableViewCell: UITableViewCell {

    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var copyrightLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var appsImageView: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
