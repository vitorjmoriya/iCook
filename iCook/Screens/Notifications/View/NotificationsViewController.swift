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
}

class NotificationsViewController: UIViewController, NotificationViewControllerDelegate {
    
    @IBOutlet weak var dinnerSwitch: UISwitch!
    @IBOutlet weak var afternoonSnackSwitch: UISwitch!
    @IBOutlet weak var lunchSwitch: UISwitch!
    @IBOutlet weak var breakfastSwitch: UISwitch!
    
    lazy var viewModel = { NotificationsViewModel() }()
    
    @IBAction func onSwitchChange(_ sender: UISwitch, forEvent event: UIEvent) {
        var seletedSwitch: NotificationsViewModel.NotificationSwitches? = nil
        
        switch sender {
            case dinnerSwitch: seletedSwitch = .Dinner
            case afternoonSnackSwitch: seletedSwitch = .AfternoonSnack
            case lunchSwitch: seletedSwitch = .Lunch
            case breakfastSwitch: seletedSwitch = .Breakfast
            default:
                break
        }
        
        //        if (notificationUIModel.isDinnerEnabled) {
        //            self.lunchSwitch.visibility = .gone
        //        }
        
        if let safeSelectedSwitch = seletedSwitch {
            if (!viewModel.hasNotificationPermitions) {
                showNotificationPermitionDisclaimer()
                sender.setOn(!sender.isOn, animated: false)
            } else {
                viewModel.dispatchViewAction(
                    .SwitchChanged(
                        on: sender.isOn,
                        switch: safeSelectedSwitch
                    )
                )
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewModel()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == NOTIFICATION_DISCLAIMER_SEGUE) {
            let destination = segue.destination as? NotificationDisclaimerViewController
            destination?.notificationViewControllerDelegate = self
        }
    }
    
    func onPermitionNotificationChange(granted: Bool) {
        viewModel.dispatchViewAction(.onPermitionChange(granted: granted))
    }
    
    private func getNotificationUIModel() {
        let notificationUIModel = viewModel.getNotificationUIModel()
        
        if (!notificationUIModel.hasDisclaimerBeenShown) {
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: NOTIFICATION_DISCLAIMER_SEGUE, sender: self)
            }
        }
        
        self.dinnerSwitch.setOn(
            notificationUIModel.isDinnerEnabled,
            animated: true
        )
        self.afternoonSnackSwitch.setOn(
            notificationUIModel.isAfternoonSnackEnabled,
            animated: true
        )
        self.lunchSwitch.setOn(
            notificationUIModel.isLunchEnabled,
            animated: true
        )
        self.breakfastSwitch.setOn(
            notificationUIModel.isBreakfastEnabled,
            animated: true
        )
    }
    
    
    private func initViewModel() {
        viewModel.dispatchViewAction(.Init)
        getNotificationUIModel()
    }
    
    private func showNotificationPermitionDisclaimer() {
        let alert = UIAlertController(title: "Permissões necessárias", message: "Altere as configurações de notificação do iCook para habilitar as notificações", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}


extension UIView {
    
    enum Visibility {
        case visible
        case invisible
        case gone
    }
    
    var visibility: Visibility {
        get {
            let constraint = (self.constraints.filter{$0.firstAttribute == .height && $0.constant == 0}.first)
            if let constraint = constraint, constraint.isActive {
                return .gone
            } else {
                return self.isHidden ? .invisible : .visible
            }
        }
        set {
            if self.visibility != newValue {
                self.setVisibility(newValue)
            }
        }
    }
    
    private func setVisibility(_ visibility: Visibility) {
        let constraint = (self.constraints.filter{$0.firstAttribute == .height && $0.constant == 0}.first)
        
        switch visibility {
            case .visible:
                constraint?.isActive = false
                self.isHidden = false
                break
            case .invisible:
                constraint?.isActive = false
                self.isHidden = true
                break
            case .gone:
                if let constraint = constraint {
                    constraint.isActive = true
                } else {
                    let constraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 0)
                    self.addConstraint(constraint)
                    constraint.isActive = true
                }
        }
    }
}
