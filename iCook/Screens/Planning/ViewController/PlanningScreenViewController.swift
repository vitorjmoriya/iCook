//
//  PlanningScreenViewController.swift
//  iCook
//
//  Created by Hunter Soares do Carmo on 11/07/21.
//

import UIKit

class PlanningScreenViewController: UIViewController {
    var planningText: UILabel
    
  
    func Initialize(){
        
        
        let font = UIFont(name: "HelveticaNeue", size: 13)!
        
        self.planningText.text = "Planejamento"
        self.planningText.backgroundColor = UIColor.clear
        self.planningText.textAlignment = .center
        self.planningText.textColor = UIColor.gray
        self.planningText.numberOfLines = 1
        self.planningText.lineBreakMode = .byTruncatingTail
        self.planningText.highlightedTextColor = UIColor.black
        self.planningText.font = font
//        self.label.autoresizingMask = [.flexibleTopMargin, .flexibleLeftMargin, .flexibleBottomMargin, .flexibleRightMargin]
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    init() {
        self.planningText = UILabel()
        super.init(nibName: nil, bundle: nil)
        //PlanningScreenViewController.initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
