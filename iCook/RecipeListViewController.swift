//
//  RecipeListViewController.swift
//  iCook
//
//  Created by Vitor Jundi Moriya on 05/07/21.
//

import Foundation
import UIKit

class RecipeListViewController: UIViewController{
    let reuseIdentifier = "cell"
    var recipeList = [Recipe]()
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeList.append(Recipe(name: "Croissant Recheado com Queijo", description: "4 porções • 60 min • Trabalhoso", image: UIImage(named: "crossaint")!))
        recipeList.append(Recipe(name: "Macarrão com Molho Branco", description: "2 porções • 15 min • Fácil", image: UIImage(named: "macarrao")!))
        recipeList.append(Recipe(name: "Ovo", description: "Ovo mexido", image: UIImage(named: "ovo")!))
       
    }
    

}

extension RecipeListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.recipeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
                
                // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.recipeName.text = self.recipeList[indexPath.row].name // The row value is the same as the index of the desired text within the array.
        cell.recipeDescription.text = self.recipeList[indexPath.row].description
        cell.cellRecipeImage.image = recipeList[indexPath.row].image
                return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("You selected cell #\(indexPath.item)!")
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RecipeViewController") as! RecipeViewController
        vc.recipe = recipeList[indexPath.item]
        self.navigationController?.pushViewController(vc, animated: false)
        
    }
    
}

struct Recipe{
    var name:String
    var description:String
    var image:UIImage
}
