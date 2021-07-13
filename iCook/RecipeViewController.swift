//
//  RecipeViewController.swift
//  iCook
//
//  Created by Vitor Jundi Moriya on 05/07/21.
//

import Foundation
import UIKit
class RecipeViewController: UIViewController {
    
    @IBOutlet weak var recipeDescription: UILabel!
    @IBOutlet weak var tagCollectionView: UICollectionView!
    @IBOutlet weak var ingredientsTableView: ContentSizedTableView!
    @IBOutlet weak var instructionsTableView: ContentSizedTableView!
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeName: UILabel!
    var recipe = Recipe(name: "Ovo", description: "Ovo mexido", image: UIImage(named: "ovo")!, instructions: ["Quebre o ovo", "Coloque na frigideira"], ingredientList: ["1 Ovo"], tags: ["Sem Glútem", "Sem Lactose"])
    override func viewDidLoad() {
        
        
        //Deixando a barra transparente
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        //Adicionando o botão direito
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "calendar.badge.plus"), style: .plain, target: self, action: nil)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        ingredientsTableView.delegate = self
        ingredientsTableView.dataSource = self
        
        instructionsTableView.delegate = self
        instructionsTableView.dataSource = self
        
        tagCollectionView.delegate = self
        tagCollectionView.dataSource = self
        
        recipeName.text = recipe.name
        recipeImage.image = recipe.image
        recipeDescription.text = recipe.description
        super.viewDidLoad()
    }
}


extension RecipeViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipe.tags.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tag", for: indexPath as IndexPath) as! RecipeTagViewCell
        cell.tagText.text = recipe.tags[indexPath.row]
        switch recipe.tags[indexPath.row] {
        case "Sem Lactose":
            cell.contentView.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.12)
            cell.tagText.textColor = UIColor.systemBlue
        case "Sem Glúten":
            cell.contentView.backgroundColor = UIColor.systemYellow.withAlphaComponent(0.12)
            cell.tagText.textColor = UIColor.systemOrange
        case "Vegetariano":
            cell.contentView.backgroundColor = UIColor.systemOrange.withAlphaComponent(0.12)
            cell.tagText.textColor = UIColor.systemOrange
        case "Vegano":
            cell.contentView.backgroundColor = UIColor.systemGreen.withAlphaComponent(0.12)
            cell.tagText.textColor = UIColor.systemGreen
        default:
            cell.contentView.backgroundColor = UIColor.systemGray2
        }
        return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        print("You selected cell #\(indexPath.item)!")

    }

}

extension RecipeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.ingredientsTableView{
            return recipe.ingredientList.count
        }else if tableView == self.instructionsTableView {
            return recipe.instructions.count
            
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.ingredientsTableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath) as! ingredientsTableViewCell
            cell.ingredient.text = recipe.ingredientList[indexPath.row]
            return cell
        }else if tableView == self.instructionsTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "instructionCell", for: indexPath) as! instructionsTableViewCell
            let myMutableString = NSMutableAttributedString(string: String(indexPath.row + 1) + ". " + recipe.instructions[indexPath.row])
            myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemGray, range: NSRange(location:0,length:2))
            cell.instruction.attributedText = myMutableString
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "instructionCell", for: indexPath) as! instructionsTableViewCell
        return cell
    }
    
}

class ingredientsTableViewCell: UITableViewCell{
    @IBOutlet weak var ingredient: UILabel!
}

class instructionsTableViewCell: UITableViewCell{
    @IBOutlet weak var instruction: UILabel!
    
}

final class ContentSizedTableView: UITableView {
    override var contentSize:CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }

    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}

class RecipeTagViewCell: UICollectionViewCell {
    
    @IBOutlet weak var tagText: UILabel!
}
