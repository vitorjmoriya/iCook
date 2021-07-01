//
//  ShoppingListTableViewController.swift
//  iCook
//
//  Created by Gabriel Oliveira Borges on 30/06/21.
//

import UIKit

class ShoppingListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    lazy var viewModel = { ShoppingListViewModel() }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        initViewModel()
    }

    @IBAction func didSelectAddItem(_ sender: UIBarButtonItem) {
        viewModel.dispatchViewAction(.FetchShoppingList)
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
        let item = viewModel.items[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingListItemCell.identifier, for: indexPath) as? ShoppingListItemCell else {
            fatalError("")
        }
        
        cell.radioButton.onDidSelect = { isChecked in
            self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
            self.tableView(tableView, didSelectRowAt: indexPath)
        }

        cell.addItem(item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
}

//MARK: - TableViewDelegate

extension ShoppingListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        viewModel.dispatchViewAction(.SelectedRow(row: indexPath.row))
    }
}
