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
    func update(with representative: Representative) {
        nameLabel.text = representative.name
        politicalPartyLabel.text = representative.party
        linkLabel.text = representative.link.absoluteString
    }
}
