//
//  DateModel.swift
//  iCook
//
//  Created by Hunter Soares do Carmo on 10/07/21.
//

import Foundation
import UIKit

struct DateItemUIModel: Equatable {
    var date : String
    var letterDate: String
    var today: Bool
    var spoon: Int
    var chooseSpoon: UIImageView
    var choosedSpoon: UIImage
    var dia: Date
    var iD: Int
    
    
    
    
    //init(data: Date, spoon: Int, Id: Int){
        
    //}
    //transformar data em string e mandar só a string
    
   /* init(dia: Date, spoon: Int) {
        self.date = fullDate(dia: Foundation.Date)
        self.letterDate = firstLetterDate(dia: Foundation.Date())
        self.today = currentDate(dia: Date)
        self.choosedSpoon = chooseSpoonImage(spoon: spoon)
    }
    
    
    
    //MARK: - Initializing infos

    
    func fullDate (dia: Date) -> String{
    // Create Date
        var dia = Foundation.Date()
    // Create Date Formatter and format
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E,d de MMMM"
        return String(dateFormatter.string(from: dia))
    }
    
    func firstLetterDate (dia: Date) -> String{
        let dia = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E"
        return String(dateFormatter.string(from: dia).prefix(1))
    }
    
    func currentDate (dia: Date) -> Bool{
        let today = Date()
        today.timeIntervalSinceReferenceDate
        return dia == today
    }
    
    func chooseSpoonImage (spoon: Int) -> UIImage{
        if(spoon == 0){
            self.chooseSpoon.image = UIImage(named: "0Spoon")
        }
        else if(spoon == 1){
            self.chooseSpoon.image = UIImage(named: "1Spoon")
        }
        else if(spoon == 2){
            self.chooseSpoon.image = UIImage(named: "2Spoon")
        }
        else if(spoon == 3){
            self.chooseSpoon.image = UIImage(named: "3Spoon")
        }
    }
    
    
    
    
    static func == (lhs: DateItemUIModel, rhs: DateItemUIModel) -> Bool {
        return
            lhs.date == rhs.date &&
            lhs.letterDate == rhs.letterDate &&
            lhs.spoon == rhs.spoon &&
            lhs.today == rhs.today &&
            lhs.choosedSpoon == rhs.choosedSpoon
    }*/
}

