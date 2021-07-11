//
//  NotificationSoundTableViewCell.swift
//  iCook
//
//  Created by Gabriel Oliveira Borges on 10/07/21.
//

import UIKit

class NotificationSoundTableViewCell: UITableViewCell {
    static let identifier = "notificationSoundCell"
    
    @IBOutlet weak var uiSwitch: UISwitch!
    private var switchType: NotificationsViewModel.SwitchType?
    private var notificationViewControllerDelegate: NotificationViewControllerDelegate?
    
    @IBAction func didTapSwitch(_ sender: UISwitch) {
        guard let type = switchType else {
            sender.setOn(!sender.isOn, animated: false)
            return
        }

        notificationViewControllerDelegate?.onSoundSwitchChange(
            on: sender.isOn,
            notificationSwitch: type
        )
    }
    
    func setCell(switchType: NotificationsViewModel.SwitchType, delegate: NotificationViewControllerDelegate, isOn: Bool?) {
        self.switchType = switchType
        self.notificationViewControllerDelegate = delegate
        self.uiSwitch.setOn(isOn ?? false, animated: false)
    }
}
