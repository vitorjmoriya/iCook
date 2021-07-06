//
//  ShoppingListItemCell.swift
//  iCook
//
//  Created by Gabriel Oliveira Borges on 01/07/21.
//

import UIKit

class ShoppingListItemCell: UITableViewCell {
    static let identifier = "itemCell"

    @IBOutlet weak var radioButton: RadioButton!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var title: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        radioButton.isChecked = false
        quantity.text = ""
        title.text = ""
    }
    
    func addItem(_ item: ShoppingListItemUIModel) {
        self.radioButton.isChecked = item.isChecked
        self.title.text = item.title
        self.quantity.text = item.quantity
    }
}

extension Float {
    func isInteger() -> Bool {
        return floor(self) == self
    }
}
