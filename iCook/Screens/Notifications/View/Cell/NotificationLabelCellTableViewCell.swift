//
//  NotificationLabelCellTableViewCell.swift
//  iCook
//
//  Created by Gabriel Oliveira Borges on 08/07/21.
//

import UIKit

class NotificationLabelCellTableViewCell: UITableViewCell {
    static let identifier = "notificationLabelCell"
    
    @IBOutlet weak var uiSwitch: UISwitch!
    
    private var switchType: NotificationsViewModel.SwitchType?
    private var notificationViewControllerDelegate: NotificationViewControllerDelegate?

    @IBAction func didTapSwitch(_ sender: UISwitch) {
        guard let type = switchType else {
            sender.setOn(!sender.isOn, animated: false)
            return
        }
        notificationViewControllerDelegate?.onLabelSwitchChange(on: sender.isOn, notificationSwitch: type, sender: sender)
    }
    
    func setCell(switchType: NotificationsViewModel.SwitchType, delegate: NotificationViewControllerDelegate, isOn: Bool) {
        self.switchType = switchType
        self.notificationViewControllerDelegate = delegate
        self.uiSwitch.setOn(isOn, animated: true)
    }
    
}
