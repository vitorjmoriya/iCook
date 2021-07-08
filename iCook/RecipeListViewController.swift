//
//  RecipeListViewController.swift
//  iCook
//
//  Created by Vitor Jundi Moriya on 05/07/21.
//

import Foundation
import UIKit

class RecipeListViewController: UIViewController{
    
    @IBOutlet weak var ForYouCollectionView: UICollectionView!
    @IBOutlet weak var PopularCollectionView: UICollectionView!
    @IBOutlet weak var breakfastCollectionView: UICollectionView!
    var recipeList = [Recipe]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        recipeList.append(Recipe(name: "Croissant Recheado com Queijo", description: "4 porções • 60 min • Trabalhoso", image: UIImage(named: "crossaint")!))
        recipeList.append(Recipe(name: "Macarrão com Molho Branco", description: "2 porções • 15 min • Fácil", image: UIImage(named: "macarrao")!))
        recipeList.append(Recipe(name: "Ovo", description: "Ovo mexido", image: UIImage(named: "ovo")!))
        recipeList.append(Recipe(name: "Ovo Denovo", description: "Ovo mexido denovo", image: UIImage(named: "ovo")!))
        recipeList.append(Recipe(name: "Ovo 2", description: "Ovo mexido", image: UIImage(named: "ovo")!))
        recipeList.append(Recipe(name: "Ovo 3", description: "Ovo mexido", image: UIImage(named: "ovo")!))
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

}

extension RecipeListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.ForYouCollectionView {
            return self.recipeList.count - 1
        }
        return self.recipeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! MyCollectionViewCell
                
                // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.recipeName.text = self.recipeList[indexPath.row].name // The row value is the same as the index of the desired text within the array.
        cell.recipeName.numberOfLines = 0
        cell.recipeDescription.text = self.recipeList[indexPath.row].description
        cell.cellRecipeImage.image = recipeList[indexPath.row].image
                return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        if collectionView == self.breakfastCollectionView{
//            return 2
//        }
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
