//
//  bookmarkAppApp.swift
//  bookmarkApp
//
//  Created by Admin on 19.04.2023.
//

import SwiftUI

enum AppScreenState {
    case onboarding
    case main
}

@main
struct bookmarkAppApp: App {
    @State var state: AppScreenState
    @State  var title = ""
    @State  var url = ""
    var isOnboardingSeen: Bool
    
    init() {
        self.isOnboardingSeen = UserDefaults.standard.object(forKey: "isOnboardingSeen") as? Bool ?? false
        switch isOnboardingSeen {
        case true:
            self.state = .main
        case false:
            self.state = .onboarding
        }
    }
    var body: some Scene {
        WindowGroup {
            switch state {
            case .onboarding:
                Onboarding(screenState: $state)
            case .main:
                ContentView(title: $title, url: $url)
            }
        }
    }
}
