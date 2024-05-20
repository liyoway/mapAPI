//
//  MapInfoTableViewCell.swift
//  mapAPI
//
//  Created by yoway Li on 2024/5/20.
//

import UIKit
import SafariServices

class MapInfoTableViewCell: UITableViewCell, SFSafariViewControllerDelegate {

    @IBOutlet weak var mapName: UILabel!
    @IBOutlet weak var mapImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var url: String?
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
