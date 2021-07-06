//
//  ShoppingListAddItemViewController.swift
//  iCook
//
//  Created by Gabriel Oliveira Borges on 02/07/21.
//

import UIKit

class ShoppingListAddItemViewController: UIViewController {
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var shoppingListViewControllerDelegate: ShoppingListViewControllerDelegate?

    private lazy var viewModel = { ShoppingListAddItemViewModel() }()

    @IBAction func onNameDidChange(_ sender: UITextField) {
        viewModel.dispatchViewAction(.NameDidChange(sender.text))
    }
    
    @IBAction func onQuantityDidChange(_ sender: UITextField) {
        viewModel.dispatchViewAction(.QuantityDidChange(sender.text))
    }
    
    @IBAction func onCancel(_ sender: Any) {
        self.dismiss(animated: true)
    }

    @IBAction func onSave(_ sender: Any) {
        self.dismiss(animated: true)
        if let quantity = viewModel.quantity, let name = viewModel.name {
            shoppingListViewControllerDelegate?.addShoppingListItem(
                ShoppingListItemUIModel(
                    title: name,
                    quantity: quantity,
                    category: "Adicionados por você",
                    isChecked: false
                )
            )
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewModel()
    }
    
    private func initViewModel() {
        viewModel.areFieldsCorrect = { areCorrect in
            self.saveButton.isEnabled = areCorrect
        }
        viewModel.dispatchViewAction(.Init)
    }
}
