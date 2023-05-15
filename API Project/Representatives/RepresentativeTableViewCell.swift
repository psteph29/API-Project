//
//  RepresentativeTableViewCell.swift
//  API Project
//
//  Created by Paige Stephenson on 4/24/23.
//

import UIKit

class RepresentativeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var politicalPartyLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
