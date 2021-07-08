//
//  NotificationDisclaimerViewController.swift
//  iCook
//
//  Created by Gabriel Oliveira Borges on 07/07/21.
//

import UIKit

class NotificationDisclaimerViewController: UIViewController {
    var notificationViewControllerDelegate: NotificationViewControllerDelegate?
    @IBAction func didTapContinue(_ sender: Any) {
        self.dismiss(animated: true) {
            let center = UNUserNotificationCenter.current()
            center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                self.notificationViewControllerDelegate?.onPermitionNotificationChange(
                    granted: granted && error == nil
                )
            }
        }
    }
}
