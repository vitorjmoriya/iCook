//
//  NotificationTimeTableViewCell.swift
//  iCook
//
//  Created by Gabriel Oliveira Borges on 10/07/21.
//

import UIKit

class NotificationTimeTableViewCell: UITableViewCell {
    static let identifier = "notificationTimeCell"
    
    @IBOutlet weak var timePicker: UIDatePicker!
    private var switchType: NotificationsViewModel.SwitchType?
    private var notificationViewControllerDelegate: NotificationViewControllerDelegate?
    
    @IBAction func timeDidChange(_ sender: UIDatePicker) {
        guard let type = switchType else {
            return
        }

        notificationViewControllerDelegate?.onTimeChange(time: sender.date, notificationSwitch: type)
    }
    
    func setCell(switchType: NotificationsViewModel.SwitchType, delegate: NotificationViewControllerDelegate, time: Date?) {
        self.switchType = switchType
        self.notificationViewControllerDelegate = delegate
        self.timePicker.date = time ?? getDefaultDate()
    }
    
    private func getDefaultDate() -> Date {
        var hour: Int = 12
        var minutes: Int = 30
        
        switch switchType {
            case .Breakfast: do {
                hour = 8
                minutes = 15
            }
            case .Lunch: do {
                hour = 12
                minutes = 0
            }
            case .AfternoonSnack: do {
                hour = 16
                minutes = 30
            }
            case .Dinner: do {
                hour = 19
                minutes = 30
            }
            default: break
        }
        
        return Calendar.current.date(bySettingHour: hour, minute: minutes, second: 0, of: Date())!
    }
}
