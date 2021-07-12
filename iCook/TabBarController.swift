//
//  TabBarController.swift
//  iCook
//
//  Created by Gabriel Oliveira Borges on 12/07/21.
//

import UIKit

class TabBarController: UITabBarController {
    let userPreferences = UserPreferences()
    private let ONBOARDING_SEGUE = "onboardingSegue"

    override func viewDidLoad() {
        showOnboardingIfNeeded()
    }
    
    private func showOnboardingIfNeeded() {
        if (userPreferences.shouldShowOnboarding()) {
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: self.ONBOARDING_SEGUE, sender: self)
            }
        }
    }
}
