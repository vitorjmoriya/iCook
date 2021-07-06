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
        recipeName.text = recipe.name
        recipeImage.image = recipe.image
        super.viewDidLoad()
    }
}
