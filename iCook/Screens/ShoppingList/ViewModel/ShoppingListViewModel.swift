//
//  ShoppingListViewModel.swift
//  iCook
//
//  Created by Gabriel Oliveira Borges on 01/07/21.
//

import Foundation

class ShoppingListViewModel: NSObject {
    var reloadTableView: (() -> Void)?
    var items: [ShoppingListItemUIModel] = [] {
        didSet {
            reloadTableView?()
        }
    }
    
    func dispatchViewAction(_ action: ViewActions) {
        switch action {
            case .FetchShoppingList: fetchShoppingList()
            case .SelectedRow(let row): didSelectRow(row)
        }
    }
    
    private func didSelectRow(_ row: Int) {
        items[row].isChecked = !items[row].isChecked
        reloadTableView?()
    }
    
    private func fetchShoppingList() {
        items.append(
            ShoppingListItemUIModel(
                title: "Limão",
                quantity: 1,
                category: "Frutas",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Laranja",
                quantity: 2,
                category: "Frutas",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Arroz",
                quantity: 2.5,
                quantityUnit: "Quilos",
                category: "Grãos",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Limão",
                quantity: 1,
                category: "Frutas",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Laranja",
                quantity: 2,
                category: "Frutas",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Arroz",
                quantity: 2.5,
                quantityUnit: "Quilos",
                category: "Grãos",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Limão",
                quantity: 1,
                category: "Frutas",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Laranja",
                quantity: 2,
                category: "Frutas",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Arroz",
                quantity: 2.5,
                quantityUnit: "Quilos",
                category: "Grãos",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Limão",
                quantity: 1,
                category: "Frutas",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Laranja",
                quantity: 2,
                category: "Frutas",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Arroz",
                quantity: 2.5,
                quantityUnit: "Quilos",
                category: "Grãos",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Limão",
                quantity: 1,
                category: "Frutas",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Laranja",
                quantity: 2,
                category: "Frutas",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Arroz",
                quantity: 2.5,
                quantityUnit: "Quilos",
                category: "Grãos",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Limão",
                quantity: 1,
                category: "Frutas",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Laranja",
                quantity: 2,
                category: "Frutas",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Arroz",
                quantity: 2.5,
                quantityUnit: "Quilos",
                category: "Grãos",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Limão",
                quantity: 1,
                category: "Frutas",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Laranja",
                quantity: 2,
                category: "Frutas",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Arroz",
                quantity: 2.5,
                quantityUnit: "Quilos",
                category: "Grãos",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Limão",
                quantity: 1,
                category: "Frutas",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Laranja",
                quantity: 2,
                category: "Frutas",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Arroz",
                quantity: 2.5,
                quantityUnit: "Quilos",
                category: "Grãos",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Limão",
                quantity: 1,
                category: "Frutas",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Laranja",
                quantity: 2,
                category: "Frutas",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Arroz",
                quantity: 2.5,
                quantityUnit: "Quilos",
                category: "Grãos",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Limão",
                quantity: 1,
                category: "Frutas",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Laranja",
                quantity: 2,
                category: "Frutas",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Arroz",
                quantity: 2.5,
                quantityUnit: "Quilos",
                category: "Grãos",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Limão",
                quantity: 1,
                category: "Frutas",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Laranja",
                quantity: 2,
                category: "Frutas",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Arroz",
                quantity: 2.5,
                quantityUnit: "Quilos",
                category: "Grãos",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Limão",
                quantity: 1,
                category: "Frutas",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Laranja",
                quantity: 2,
                category: "Frutas",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Arroz",
                quantity: 2.5,
                quantityUnit: "Quilos",
                category: "Grãos",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Limão",
                quantity: 1,
                category: "Frutas",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Laranja",
                quantity: 2,
                category: "Frutas",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Arroz",
                quantity: 2.5,
                quantityUnit: "Quilos",
                category: "Grãos",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Limão",
                quantity: 1,
                category: "Frutas",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Laranja",
                quantity: 2,
                category: "Frutas",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Arroz",
                quantity: 2.5,
                quantityUnit: "Quilos",
                category: "Grãos",
                isChecked: false
            )
        )
        
        reloadTableView?()
    }
    
    enum ViewActions {
        case FetchShoppingList
        case SelectedRow(row: Int)
    }
}
