//
//  ShooppingListGroupTableViewCell.swift
//  iCook
//
//  Created by Gabriel Oliveira Borges on 01/07/21.
//

import UIKit

class ShooppingListGroupTableViewCell: UITableViewCell {
    @IBOutlet weak var groupLabel: UILabel!
    static let identifier = "groupCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        groupLabel.text = ""
    }

}
