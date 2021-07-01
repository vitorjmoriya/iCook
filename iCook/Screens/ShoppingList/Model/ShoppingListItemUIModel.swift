//
//  ShoppingListItem.swift
//  iCook
//
//  Created by Gabriel Oliveira Borges on 01/07/21.
//

import Foundation

struct ShoppingListItemUIModel {
    var title: String
    var quantity: Float
    var quantityUnit: String? = nil
    var category: String
    var isChecked: Bool
}
