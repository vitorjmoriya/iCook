//
//  UserDefautls.swift
//  iCook
//
//  Created by Gabriel Oliveira Borges on 12/07/21.
//

import Foundation

class UserPreferences {
    static let newInstance = UserPreferences()
    
    private let userDefaults = UserDefaults.standard
    private let SHOULD_SHOW_ONBOARDING_KEY = "SHOULD_SHOW_ONBOARDING_KEY"
    
    func shouldShowOnboarding() -> Bool {
        let shouldShow = userDefaults.value(forKey: SHOULD_SHOW_ONBOARDING_KEY)
        
        
        if (shouldShow == nil) {
            setShouldShowOnboarding(false)
        }
        
        return shouldShow == nil
    }
    
    private func setShouldShowOnboarding(_ value: Bool) {
        userDefaults.set(value, forKey: SHOULD_SHOW_ONBOARDING_KEY)
    }
}
