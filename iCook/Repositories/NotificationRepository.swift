//
//  NotificationRepository.swift
//  iCook
//
//  Created by Gabriel Oliveira Borges on 07/07/21.
//

import Foundation

class NotificationRepository {
    private let LUNCH_NOTIFICATION_KEY = "LUNCH_NOTIFICATION_KEY"
    private let DINNER_NOTIFICATION_KEY = "DINNER_NOTIFICATION_KEY"
    private let BREAKFAST_NOTIFICATION_KEY = "BREAKFAST_NOTIFICATION_KEY"
    private let AFTERNOON_SNACK_NOTIFICATION_KEY = "AFTERNOON_SNACK_NOTIFICATION_KEY"
    private let DISCLAIMER_BEEN_SHOWN_KEY = "DISCLAIMER_BEEN_SHOWN_KEY"

    private var userDefaults = UserDefaults.standard
    
    static let newInstance = NotificationRepository()
    
    func getNotificationSettings() -> NotificationsUIModel {
        return NotificationsUIModel(
            isBreakfastEnabled: isBreakfastNotificationEnabled(),
            isLunchEnabled: isLunchNotificationEnabled(),
            isAfternoonSnackEnabled: isAfternoonSnackNotificationEnabled(),
            isDinnerEnabled: isDinnerNotificationEnabled(),
            hasDisclaimerBeenShown: hasDisclaimerBeenShown()
        )
    }
    
    func setLunchNotification(_ isEnabled: Bool) {
        userDefaults.set(isEnabled, forKey: LUNCH_NOTIFICATION_KEY)
    }
    
    func setDinnerNotification(_ isEnabled: Bool) {
        userDefaults.set(isEnabled, forKey: DINNER_NOTIFICATION_KEY)
    }
    
    func setBreakfastNotification(_ isEnabled: Bool) {
        userDefaults.set(isEnabled, forKey: BREAKFAST_NOTIFICATION_KEY)
    }
    
    func setAfternoonSnackNotification(_ isEnabled: Bool) {
        userDefaults.set(isEnabled, forKey: AFTERNOON_SNACK_NOTIFICATION_KEY)
    }
 
    private func isLunchNotificationEnabled() -> Bool {
        return userDefaults.bool(forKey: LUNCH_NOTIFICATION_KEY)
    }
    
    private func isDinnerNotificationEnabled() -> Bool {
        return userDefaults.bool(forKey: DINNER_NOTIFICATION_KEY)
    }
    
    private func isBreakfastNotificationEnabled() -> Bool {
        return userDefaults.bool(forKey: BREAKFAST_NOTIFICATION_KEY)
    }
    
    private func isAfternoonSnackNotificationEnabled() -> Bool {
        return userDefaults.bool(forKey: AFTERNOON_SNACK_NOTIFICATION_KEY)
    }
    
    private func hasDisclaimerBeenShown() -> Bool {
        let hasBeenShown = userDefaults.bool(forKey: DISCLAIMER_BEEN_SHOWN_KEY)
        
        if (!hasBeenShown) {
            userDefaults.set(true, forKey: DISCLAIMER_BEEN_SHOWN_KEY)
        }
        
        return hasBeenShown
    }
}
