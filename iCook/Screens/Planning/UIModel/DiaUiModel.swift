//
//  DiaUiModel.swift
//  iCook
//
//  Created by Hunter Soares do Carmo on 12/07/21.
//

import Foundation
import UIKit
class DiaUiModel{
    var dia: String
    var spoon: String
    var diaLetra: String
    var coffeeBreak: String
    var lunch: String
    var dinner: String
    
    init(dia: String, spoon: String, diaLetra: String, coffeeBreak: String, lunch: String, dinner: String){
        self.dia = dia
        self.spoon = spoon
        self.diaLetra = diaLetra
        self.coffeeBreak = coffeeBreak
        self.lunch = lunch
        self.dinner = dinner
        
    }
    
}
