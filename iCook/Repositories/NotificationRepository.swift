//
//  NotificationRepository.swift
//  iCook
//
//  Created by Gabriel Oliveira Borges on 07/07/21.
//

import Foundation

class NotificationRepository {
    private let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Notifications.plist")
    
    static let newInstance = NotificationRepository()
    
    func getNotificationSettings() -> NotificationsUIModel? {
        let decoder = PropertyListDecoder()
        
        do {
            let data = try Data(contentsOf: dataFilePath!)
            return try decoder.decode(NotificationsUIModel.self, from: data)
        } catch {
            print("Error while decoding notifications \(error)")
            let model = NotificationsUIModel(
                breakfast: MealModel(areNotificationsEnabled: false),
                lunch: MealModel(areNotificationsEnabled: false),
                afternoonSnack: MealModel(areNotificationsEnabled: false),
                dinner: MealModel(areNotificationsEnabled: false),
                hasDisclaimerBeenShown: false
            )
            setNotificationSettings(model)
            return model
        }
    }
    
    func setNotificationSettings(_ model: NotificationsUIModel) {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(model)
            try data.write(to: self.dataFilePath!)
        } catch {
            print("Error while encoding notifications \(error)")
        }
    }
}
