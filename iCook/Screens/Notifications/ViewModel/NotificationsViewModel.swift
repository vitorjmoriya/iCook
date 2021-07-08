//
//  NotificationsViewModel.swift
//  iCook
//
//  Created by Gabriel Oliveira Borges on 06/07/21.
//

import UIKit

class NotificationsViewModel: NSObject {
    var hasNotificationPermitions: Bool = false

    private let notificationRepository = NotificationRepository.newInstance
    
    func dispatchViewAction(_ action: ViewAction) {
        switch action {
            case .Init: onInit()
            case .onPermitionChange(let granted): hasNotificationPermitions = granted
            case .SwitchChanged(let on, let selectedSwitch): onSwitchChange(
                on: on,
                selectedSwitch: selectedSwitch
            )
        }
    }
    
    func getNotificationUIModel() -> NotificationsUIModel {
        return notificationRepository.getNotificationSettings()
    }
    
    private func onInit() {
        getNotificationPermition()
    }
    
    private func onSwitchChange(on: Bool, selectedSwitch: NotificationSwitches) {
        switch selectedSwitch {
            case .AfternoonSnack: notificationRepository.setAfternoonSnackNotification(on)
            case .Breakfast: notificationRepository.setBreakfastNotification(on)
            case .Dinner: notificationRepository.setDinnerNotification(on)
            case .Lunch: notificationRepository.setLunchNotification(on)
        }
    }
    
    private func getNotificationPermition() {
        let center = UNUserNotificationCenter.current()
        center.getNotificationSettings { settings in
            self.hasNotificationPermitions = settings.authorizationStatus == .authorized
        }
    }
    
    enum ViewAction {
        case Init
        case SwitchChanged(on: Bool, switch: NotificationSwitches)
        case onPermitionChange(granted: Bool)
    }
    
    enum NotificationSwitches {
        case Breakfast
        case Lunch
        case AfternoonSnack
        case Dinner
    }
}
