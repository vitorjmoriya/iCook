//
//  NotificationsViewModel.swift
//  iCook
//
//  Created by Gabriel Oliveira Borges on 06/07/21.
//

import UIKit

class NotificationsViewModel: NSObject {
    var shouldReloadTable: (() -> Void)?
    var hasNotificationPermitions: Bool = false {
        didSet {
            guard var model = uiModel else {
                return
            }
            model.hasDisclaimerBeenShown = true
            self.notificationRepository.setNotificationSettings(model)
        }
    }
    var sections = ["CAFÉ DA MANHÃ", "ALMOÇO", "LANCHE", "JANTAR"]
    var uiModel: NotificationsUIModel? {
        didSet {
            guard let model = uiModel else {
                return
            }
            self.notificationRepository.setNotificationSettings(model)
            self.shouldReloadTable?()
        }
    }
    
    private let notificationRepository = NotificationRepository.newInstance
    
    func dispatchViewAction(_ action: ViewAction) {
        switch action {
            case .Init: onInit()
            case .onPermitionChange(let granted): hasNotificationPermitions = granted
            case .onLabelSwitchChanged(let on, let selectedSwitch): onLabelSwitchChange(
                on: on,
                selectedSwitch: selectedSwitch
            )
        }
    }
    
    func getMealModelForIndexPath(_ indexPath: IndexPath) -> MealModel? {
        return getMealModelForSection(section: indexPath.section)
    }
    
    func getNumberOfRowsInSection(section: Int) -> Int {
        let mealModel = getMealModelForSection(section: section)
        
        if (mealModel == nil) {
            return 0
        }
        
        return mealModel!.areNotificationsEnabled ? 3 : 1
    }
    
    func getNumberOfSections() -> Int {
        return self.uiModel == nil ? 0 : self.sections.count
    }
    
    func getSwitchTypeForIndexPath(_ indexPath: IndexPath) -> SwitchType {
        switch indexPath.section {
            case 0: return .Breakfast
            case 1: return .Lunch
            case 2: return .AfternoonSnack
            case 3: return .Dinner
            default: fatalError("Invalid section number \(indexPath.section)")
        }
    }
    
    private func getMealModelForSection(section: Int) -> MealModel? {
        guard let model = uiModel else {
            return nil
        }
        
        switch section {
            case 0: return model.breakfast
            case 1: return model.lunch
            case 2: return model.afternoonSnack
            case 3: return model.dinner
            default: fatalError("Invalid section number \(section)")
        }
    }
    
    private func getNotificationPermition() {
        let center = UNUserNotificationCenter.current()
        center.getNotificationSettings { settings in
            self.hasNotificationPermitions = settings.authorizationStatus == .authorized
        }
    }
    
    private func getNotificationUIModel() {
        self.uiModel = notificationRepository.getNotificationSettings()
    }
    
    private func onInit() {
        getNotificationUIModel()
        getNotificationPermition()
    }
    
    private func onLabelSwitchChange(on: Bool, selectedSwitch: SwitchType) {
        updateUIModel(seletectedSwitch: selectedSwitch, isLabelSwitchOn: on)
    }
    
    private func updateUIModel(seletectedSwitch: SwitchType, isLabelSwitchOn: Bool? = nil, isSoundSwitchOn: Bool? = nil) {
        guard var model = uiModel else { return }
        
        switch seletectedSwitch {
            case .Breakfast: do {
                model.breakfast.areNotificationsEnabled = isLabelSwitchOn ?? model.breakfast.areNotificationsEnabled
                model.breakfast.areSoundNotificationsEnabled = isSoundSwitchOn ?? model.breakfast.areSoundNotificationsEnabled
            }
            case .Lunch: do {
                model.lunch.areNotificationsEnabled = isLabelSwitchOn ?? model.lunch.areNotificationsEnabled
                model.lunch.areSoundNotificationsEnabled = isSoundSwitchOn ?? model.lunch.areSoundNotificationsEnabled
            }
            case .AfternoonSnack: do {
                model.afternoonSnack.areNotificationsEnabled = isLabelSwitchOn ?? model.afternoonSnack.areNotificationsEnabled
                model.afternoonSnack.areSoundNotificationsEnabled = isSoundSwitchOn ?? model.afternoonSnack.areSoundNotificationsEnabled
            }
            case .Dinner: do {
                model.dinner.areNotificationsEnabled = isLabelSwitchOn ?? model.dinner.areNotificationsEnabled
                model.dinner.areSoundNotificationsEnabled = isSoundSwitchOn ?? model.dinner.areSoundNotificationsEnabled
            }
        }
        uiModel = model
    }
    
    enum ViewAction {
        case Init
        case onLabelSwitchChanged(on: Bool, switch: SwitchType)
        case onPermitionChange(granted: Bool)
    }
    
    enum SwitchType {
        case Breakfast
        case Lunch
        case AfternoonSnack
        case Dinner
    }
}
