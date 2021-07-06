//
//  RadioButton.swift
//  iCook
//
//  Created by Gabriel Oliveira Borges on 01/07/21.
//

import UIKit

class RadioButton: UIButton {
    private let checkedImage = UIImage(systemName: "largecircle.fill.circle")
    private let uncheckedImage = UIImage(systemName: "circle")
    
    var onDidSelect: ((_ selected: Bool) -> Void)?
    
    var isChecked: Bool = false {
        didSet {
            if isChecked == true {
                self.setImage(checkedImage, for: UIControl.State.normal)
            } else {
                self.setImage(uncheckedImage, for: UIControl.State.normal)
            }
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        self.isChecked = false
    }
    
    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            self.onDidSelect?(!isChecked)
        }
    }
}
