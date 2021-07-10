//
//  ShoppingListTableViewController.swift
//  iCook
//
//  Created by Gabriel Oliveira Borges on 30/06/21.
//

import UIKit

protocol ShoppingListViewControllerDelegate {
    func addShoppingListItem(_ item: ShoppingListItemUIModel)
}

private let ADD_SHOPPING_LIST_ITEM_SEGUE = "goToShoppingListAddItem"

class ShoppingListViewController: UIViewController, ShoppingListViewControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    private lazy var viewModel = { ShoppingListViewModel() }()
    
    @IBAction func didSelectAddItem(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: ADD_SHOPPING_LIST_ITEM_SEGUE, sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        initViewModel()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let identifier = segue.identifier
        
        if (identifier == ADD_SHOPPING_LIST_ITEM_SEGUE) {
            let destination = (segue.destination as? UINavigationController)?.viewControllers.first as? ShoppingListAddItemViewController
            destination?.shoppingListViewControllerDelegate = self
        }
    }
    
    func addShoppingListItem(_ item: ShoppingListItemUIModel) {
        viewModel.dispatchViewAction(.AddItem(item))
    }
    
    private func initViewModel() {
        viewModel.dispatchViewAction(.FetchShoppingList)
        
        viewModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
}

//MARK: - TableViewDataSource

extension ShoppingListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.getItemForIndexPath(indexPath: indexPath)

        guard let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingListItemCell.identifier, for: indexPath) as? ShoppingListItemCell else {
            fatalError("")
        }
        
        cell.radioButton.onDidSelect = { _ in
            self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
            self.tableView(tableView, didSelectRowAt: indexPath)
        }
        
        cell.addItem(item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRowsForSection(section: section)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.getNumberOfSections()
    }
}

//MARK: - TableViewDelegate

extension ShoppingListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        viewModel.dispatchViewAction(.SelectedRow(indexPath))
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            let isLastItemInSection = viewModel.isLastItemInSection(indexPath: indexPath)
            viewModel.dispatchViewAction(.DeleteRow(indexPath))
            if (isLastItemInSection) {
                let indexSet = IndexSet(arrayLiteral: indexPath.section)
                tableView.deleteSections(indexSet, with: .automatic)
            } else {
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let category = viewModel.getSectionHeader(section: section)
        let header = PaddingLabel(top: 32, bottom: 8, left: 15, right: 0)
        header.text = category.uppercased()
        header.textColor = .secondaryLabel
        header.backgroundColor = .secondarySystemBackground
        
        return header
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 58
    }
}
