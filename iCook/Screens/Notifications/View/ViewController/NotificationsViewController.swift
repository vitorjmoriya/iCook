//
//  NotificationsViewController.swift
//  iCook
//
//  Created by Gabriel Oliveira Borges on 06/07/21.
//

import UIKit

private let NOTIFICATION_DISCLAIMER_SEGUE = "goToNotificationDisclaimerSegue"

protocol NotificationViewControllerDelegate {
    func onPermitionNotificationChange(granted: Bool)
    
    func onLabelSwitchChange(on: Bool, notificationSwitch: NotificationsViewModel.SwitchType, sender: UISwitch)
}

class NotificationsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    lazy var viewModel = { NotificationsViewModel() }()
    
    override func viewWillAppear(_ animated: Bool) {
        initViewModel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == NOTIFICATION_DISCLAIMER_SEGUE) {
            let destination = segue.destination as? NotificationDisclaimerViewController
            destination?.notificationViewControllerDelegate = self
        }
    }
    
    private func initViewModel() {
        viewModel.shouldReloadTable = {
            self.tableView.reloadData()
            self.tableView.tableFooterView = UIView()
        }
        viewModel.dispatchViewAction(.Init)
        showDisclaimerIfNeeded()
    }
    
    private func initTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func showDisclaimerIfNeeded() {
        guard let uiModel = viewModel.uiModel else {
            return
        }
        if (!uiModel.hasDisclaimerBeenShown) {
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: NOTIFICATION_DISCLAIMER_SEGUE, sender: self)
            }
        }
    }
    
    private func showNotificationPermitionDisclaimer() {
        let alert = UIAlertController(title: "Permissões necessárias", message: "Altere as configurações de notificação do iCook para habilitar as notificações", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

//MARK: - NotificationViewControllerDelegate

extension NotificationsViewController: NotificationViewControllerDelegate {
    
    func onLabelSwitchChange(on: Bool, notificationSwitch: NotificationsViewModel.SwitchType, sender: UISwitch) {
        if (!viewModel.hasNotificationPermitions) {
            showNotificationPermitionDisclaimer()
            sender.setOn(!sender.isOn, animated: false)
        } else {
            viewModel.dispatchViewAction(
                .onLabelSwitchChanged(on: on, switch: notificationSwitch)
            )
        }
    }
    
    func onPermitionNotificationChange(granted: Bool) {
        viewModel.dispatchViewAction(.onPermitionChange(granted: granted))
    }
}


//MARK: - UITableViewDataSource

extension NotificationsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.getNumberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let cell: BaseNotificationTableViewCell? To this later! Falta fazer esse mano e lidar com os dados
        guard let mealModel = viewModel.getMealModelForIndexPath(indexPath) else {
            fatalError("Could not load mealModel. Probably uiModel has not been loaded yet")
        }
        let switchType = viewModel.getSwitchTypeForIndexPath(indexPath)
        
        if (indexPath.row == 0) {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NotificationLabelCellTableViewCell.identifier) as? NotificationLabelCellTableViewCell else {
                fatalError("Could not find cell with given identifier")
            }
            cell.setCell(switchType: switchType, delegate: self, isOn: mealModel.areNotificationsEnabled)
            return cell
        } else if (indexPath.row == 1) {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NotificationLabelCellTableViewCell.identifier) as? NotificationLabelCellTableViewCell else {
                fatalError("Could not find cell with given identifier")
            }
            cell.setCell(switchType: switchType, delegate: self, isOn: mealModel.areSoundNotificationsEnabled ?? false)
            return cell
        } else if (indexPath.row == 2) {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NotificationLabelCellTableViewCell.identifier) as? NotificationLabelCellTableViewCell else {
                fatalError("Could not find cell with given identifier")
            }
            cell.setCell(switchType: switchType, delegate: self, isOn: mealModel.areSoundNotificationsEnabled ?? false)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
}

//MARK: - UITableViewDelegate

extension NotificationsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 58
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let category = viewModel.sections[section]
        let header = PaddingLabel(top: 32, bottom: 8, left: 15, right: 0)
        header.text = category.uppercased()
        header.textColor = .secondaryLabel
        header.backgroundColor = .secondarySystemBackground
        
        return header
    }
}
