//
//  ShoppingListItem.swift
//  iCook
//
//  Created by Gabriel Oliveira Borges on 01/07/21.
//

import Foundation

struct ShoppingListItemUIModel: Equatable {
    var title: String
    var quantity: String
    var category: String
    var isChecked: Bool
    
    static func == (lhs: ShoppingListItemUIModel, rhs: ShoppingListItemUIModel) -> Bool {
        return
            lhs.title == rhs.title &&
            lhs.quantity == rhs.quantity &&
            lhs.category == rhs.category &&
            lhs.isChecked == rhs.isChecked
    }
}
