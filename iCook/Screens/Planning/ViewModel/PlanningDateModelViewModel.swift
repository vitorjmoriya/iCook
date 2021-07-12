//
//  PlanningDateModelViewModel.swift
//  iCook
//
//  Created by Hunter Soares do Carmo on 10/07/21.
//

import Foundation

class PlanningDatetViewModel: NSObject {
    var plan: [DiaUiModel] = []
    
    
    func getData()-> [DiaUiModel]{
        self.plan.append(
            DiaUiModel(dia: "Hoje, 12 de julho", spoon: "3Spoon", diaLetra: "S", coffeeBreak: "crossaint, crossaint, crossaint", lunch: "crossaint, crossaint, crossaint", dinner: "crossaint, crossaint, crossaint") )
        self.plan.append(
            DiaUiModel(dia: "Hoje, 12 de julho", spoon: "3Spoon", diaLetra: "S", coffeeBreak: "crossaint, crossaint, crossaint", lunch: "crossaint, crossaint, crossaint", dinner: "crossaint, crossaint, crossaint") )
        self.plan.append(
            DiaUiModel(dia: "Hoje, 12 de julho", spoon: "3Spoon", diaLetra: "S", coffeeBreak: "crossaint, crossaint, crossaint", lunch: "crossaint, crossaint, crossaint", dinner: "crossaint, crossaint, crossaint") )
        return self.plan
    }
    
    
    override init(){
        self.plan.append(
            DiaUiModel(dia: "Hoje, 12 de julho", spoon: "3Spoon", diaLetra: "S", coffeeBreak: "crossaint, crossaint, crossaint", lunch: "crossaint, crossaint, crossaint", dinner: "crossaint, crossaint, crossaint") )
        /*self.plan[0].dia="Hoje, 12 de julho"
        self.plan[0].spoon = "3Spoon"
        self.plan[0].diaLetra =  "S"
        self.plan[0].coffeeBreak = "crossaint, crossaint, crossaint"
        self.plan[0].lunch = "crossaint, crossaint, crossaint"
        self.plan[0].dinner = "crossaint, crossaint, crossaint"
        
        self.plan[1].dia="Hoje, 13 de julho"
        self.plan[1].spoon = "2Spoon"
        self.plan[1].diaLetra =  "T"
        self.plan[1].coffeeBreak = "crossaint, crossaint, crossaint"
        self.plan[1].lunch = "crossaint, crossaint, crossaint"
        self.plan[1].dinner = "crossaint, crossaint, crossaint"
        
        plan[2].dia="Hoje, 14 de julho"
        plan[2].spoon = "1Spoon"
        plan[2].diaLetra =  "Q"
        plan[2].coffeeBreak = "crossaint, crossaint, crossaint"
        plan[2].lunch = "crossaint, crossaint, crossaint"
        plan[2].dinner = "crossaint, crossaint, crossaint"*/
                
    
    }
}
