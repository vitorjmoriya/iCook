//
//  NotificationsUIModel.swift
//  iCook
//
//  Created by Gabriel Oliveira Borges on 06/07/21.
//

import Foundation

struct NotificationsUIModel: Codable {
    var breakfast: MealModel
    var lunch: MealModel
    var afternoonSnack: MealModel
    var dinner: MealModel
    var hasDisclaimerBeenShown: Bool
}

struct MealModel: Codable {
    var areNotificationsEnabled: Bool
    var areSoundNotificationsEnabled: Bool? = nil
    var notificationsTime: Date? = nil
}
