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
            case .SelectedRow(let indexPath): didSelectRow(indexPath)
            case .AddItem(let item): addItem(item)
            case .DeleteRow(let indexPath): deleteAtIndexPath(indexPath)
        }
    }
    
    func getItemForIndexPath(indexPath: IndexPath) -> ShoppingListItemUIModel {
        let category = getDistinctCategories()[indexPath.section]
        return getItemsForCategory(for: category)[indexPath.row]
    }
    
    func getNumberOfRowsForSection(section: Int) -> Int {
        let category = getDistinctCategories()[section]
        
        return getItemsForCategory(for: category).count
    }
    
    func getNumberOfSections() -> Int {
        return getDistinctCategories().count
    }
    
    func getSectionHeader(section: Int) -> String {
        return getDistinctCategories()[section]
    }
    
    func isLastItemInSection(indexPath: IndexPath) -> Bool {
        let category = getDistinctCategories()[indexPath.section]
        let itemsInCategory = getItemsForCategory(for: category)
        
        return itemsInCategory.count == 1
    }
    
    private func addItem(_ item: ShoppingListItemUIModel) {
        // TODO: Save item in memory here
        items.append(item)
    }
    
    private func deleteAtIndexPath(_ indexPath: IndexPath) {
        let index = getItemIndexForIndexPath(indexPath: indexPath)
        
        self.items.remove(at: index)
    }
    
    private func didSelectRow(_ indexPath: IndexPath) {
        let index = getItemIndexForIndexPath(indexPath: indexPath)
        items[index].isChecked = !items[index].isChecked
        reloadTableView?()
    }
    
    private func fetchShoppingList() {
        // TODO: load the shopping list from memory here and remove these appends
        items.append(
            ShoppingListItemUIModel(
                title: "Limão",
                quantity: "4",
                category: "hortifruti",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Bananas Maduras",
                quantity: "2",
                category: "hortifruti",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Cabeças de alho",
                quantity: "2",
                category: "hortifruti",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Batata-doce",
                quantity: "4",
                category: "hortifruti",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Arroz",
                quantity: "1 pacote",
                category: "Grãos",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Feijão",
                quantity: "1 pacote",
                category: "Grãos",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Grão de bico",
                quantity: "1 pacote",
                category: "Grãos",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Aveia em flocos",
                quantity: "1 pacote",
                category: "Grãos",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Pimenta malagueta",
                quantity: "1 pacote",
                category: "Temperos",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Sal",
                quantity: "1 pacote",
                category: "Temperos",
                isChecked: false
            )
        )
        items.append(
            ShoppingListItemUIModel(
                title: "Orégano",
                quantity: "1 pacote",
                category: "Temperos",
                isChecked: false
            )
        )
        reloadTableView?()
    }
    
    private func getDistinctCategories() -> [String] {
        var distinctCategories: [String] = []
        self.items.forEach { item in
            if (!distinctCategories.contains(where: { arrayItem in
                arrayItem.uppercased() == item.category.uppercased()
            })) {
                distinctCategories.append(item.category)
            }
        }
        return distinctCategories
    }
    
    private func getItemIndexForIndexPath(indexPath: IndexPath) -> Int {
        let item = getItemForIndexPath(indexPath: indexPath)
        
        return self.items.firstIndex{ $0 == item }!
    }
    
    private func getItemsForCategory(for category: String) -> [ShoppingListItemUIModel] {
        return self.items.filter { item in
            item.category.uppercased() == category.uppercased()
        }
    }
    
    enum ViewActions {
        case FetchShoppingList
        case SelectedRow(_ indexPath: IndexPath)
        case DeleteRow(_ indexPath: IndexPath)
        case AddItem(_ item: ShoppingListItemUIModel)
    }
}
