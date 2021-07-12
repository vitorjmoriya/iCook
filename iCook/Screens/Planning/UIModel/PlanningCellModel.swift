//
//  PlanningCellModel.swift
//  iCook
//
//  Created by Hunter Soares do Carmo on 12/07/21.
//

import Foundation
import UIKit

class PlanningCellModel : UICollectionViewCell{
    var image: String
    var title: String
    
    init(image: String, title: String){
        
        self.image = image
        self.title = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
