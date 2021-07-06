//
//  RecipeViewController.swift
//  iCook
//
//  Created by Vitor Jundi Moriya on 05/07/21.
//

import Foundation
import UIKit
class RecipeViewController: UIViewController {
    
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeName: UILabel!
    var recipe = Recipe(name: "teste", description: "nADA", image: UIImage(named: "ovo")!)
    override func viewDidLoad() {
        
        //Deixando a barra transparente
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        //Adicionando o botão direito
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "calendar.badge.plus"), style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.systemRed
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        
        
        recipeName.text = recipe.name
        recipeImage.image = recipe.image
        super.viewDidLoad()
    }
}
