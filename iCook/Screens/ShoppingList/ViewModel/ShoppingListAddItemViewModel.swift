//
//  ShoppingListAddItemViewModel.swift
//  iCook
//
//  Created by Gabriel Oliveira Borges on 02/07/21.
//
import Foundation

class ShoppingListAddItemViewModel: NSObject {
    var name: String? {
        didSet {
            validadeFields()
        }
    }
    var quantity: String? {
        didSet {
            validadeFields()
        }
    }
    
    var areFieldsCorrect: ((_ areFieldsCorrect: Bool) -> Void)?

    func dispatchViewAction(_ action: ViewActions) {
        switch action {
            case .Init: validadeFields()
            case .NameDidChange(let name): self.name = name
            case .QuantityDidChange(let quantity): self.quantity = quantity
        }
    }
    
    private func validadeFields() {
        let isNameValid = name != nil && name!.count > 0
        let isQuantityValid = quantity != nil && quantity!.count > 0
        
        areFieldsCorrect?(isNameValid && isQuantityValid)
    }
    
    enum ViewActions {
        case Init
        case NameDidChange(_ name: String?)
        case QuantityDidChange(_ quantity: String?)
    }
}
