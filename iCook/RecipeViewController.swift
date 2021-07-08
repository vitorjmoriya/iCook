//
//  RecipeViewController.swift
//  iCook
//
//  Created by Vitor Jundi Moriya on 05/07/21.
//

import Foundation
import UIKit
class RecipeViewController: UIViewController {
    let reuseIdentifier = "cell"
    let recipeAttributes = ["⏰\n15 min", "👥2 porções"]
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


extension RecipeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipeAttributes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! recipeAttributeViewCell
//                // Use the outlet in our custom class to get a reference to the UILabel in the cell
//        cell.recipeName.text = self.recipeList[indexPath.row].name // The row value is the same as the index of the desired text within the array.
//        cell.recipeDescription.text = self.recipeList[indexPath.row].description
//        cell.cellRecipeImage.image = recipeList[indexPath.row].image
        cell.recipeAttribute.text = recipeAttributes[indexPath.row]
                return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("You selected cell #\(indexPath.item)!")
        
    }
    
}

class recipeAttributeViewCell: UICollectionViewCell {
    
    @IBOutlet weak var recipeAttribute: UILabel!
}

