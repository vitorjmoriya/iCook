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
        recipeList.append(Recipe(name: "Ovo", description: "1 porções • 10 min • Fácil", image: UIImage(named: "ovo")!, instructions: ["Quebre o ovo", "Coloque na frigideira"], ingredientList: ["1 Ovo"], tags: ["Vegetariano","Sem Glútem", "Sem Lactose"]))
        recipeList.append(Recipe(name: "Croissant Recheado com Queijo", description: "4 porções • 60 min • Trabalhoso", image: UIImage(named: "crossaint")!, instructions: ["Misture a massa", "Coloque no forno"], ingredientList: ["Farinha", "Água", "Fermento", "Queijo"], tags: ["Vegetariano"]))
        recipeList.append(Recipe(name: "Macarrão com Molho Branco", description: "2 porções • 15 min • Fácil", image: UIImage(named: "macarrao")!, instructions: ["Cozinhe a masssa", "Faça o molho"], ingredientList: ["Macarrarão","Leite", "Manteiga", "Farinha", "Cebola Picada"], tags: ["Vegetariano"]))
        recipeList.append(Recipe(name: "Yakissoba Vegano", description: "8 porções • 50 min • Trabalhoso", image: UIImage(named: "yakissoba")!, instructions: ["Cozinhe a masssa", "Pique as verduras"], ingredientList: ["Macarrarão","Verduras", "Molho Shoyu", "Óleo de gergelim"], tags: ["Vegetariano", "Vegano"]))
        recipeList.append(Recipe(name: "Salada de Fruta", description: "1 porções • 5 min • Fácil", image: UIImage(named: "fruitSalad")!, instructions: ["Corte as frutas", "Misture"], ingredientList: ["Frutas"], tags: ["Vegetariano", "Vegano", "Sem Lactose", "Sem Glútem"]))
        recipeList.append(Recipe(name: "Hamburguer", description: "1 porções • 40 min • Médio", image: UIImage(named: "hamburguer")!, instructions: ["Faça o hamburguer", "Monte o sanduiche"], ingredientList: ["Carne Moida", "Pão de Hamburguer", "Queijo", "Alface", "Tomate", "Cebola"], tags: ["null"]))

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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RecipeViewController") as! RecipeViewController
        vc.recipe = recipeList[indexPath.item]
        self.navigationController?.pushViewController(vc, animated: false)
        
    }
    
}

struct Recipe{
    var name:String
    var description:String
    var image:UIImage
    var instructions:[String]
    var ingredientList:[String]
    var tags:[String]
}
