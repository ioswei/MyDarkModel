//
//  MyDarkModelApp.swift
//  MyDarkModel
//
//  Created by iOSAwei on 2024/2/5.
//

import SwiftUI

@main
struct MyDarkModelApp: App {
        
    @StateObject private var appearanceManager = AppearanceManager()
    
    @Environment(\.colorScheme) var colorScheme

    var body: some Scene {
        WindowGroup {
            ContentMainUIView()
                .environmentObject(appearanceManager)
                .preferredColorScheme(appearanceManager.isDarkMode ? .dark : .light)
        }
    }
}

class AppearanceManager: ObservableObject {
    
    enum AppearanceColor: Int {
        case iSystem = 0
        case iHight = 1
        case iDark = 2
    }
    
    @Published var isDarkMode: Bool = false
    
    @Published var type: AppearanceColor {
        didSet{
            switch type {
            case .iSystem:
                isDarkMode = (getCurrentInterfaceStyle() == .dark)
            case .iHight:
                isDarkMode = false
            case .iDark:
                isDarkMode = true
            }
            UserDefaults.standard.set(type.rawValue, forKey: "darkMode")
        }
    }
    
    init() {
        
        type = AppearanceColor(rawValue: UserDefaults.standard.integer(forKey: "darkMode")) ?? .iSystem
        switch type {
        case .iSystem:
            isDarkMode = (getCurrentInterfaceStyle() == .dark)
        case .iHight:
            isDarkMode = false
        case .iDark:
            isDarkMode = true
        }
                
    }
    
    func getCurrentInterfaceStyle() -> UIUserInterfaceStyle {
        if #available(iOS 13.0, *) {
            return UIScreen.main.traitCollection.userInterfaceStyle
        } else {
            // 在iOS 12或更早的版本中，默认为明亮模式
            return .light
        }
    }

    
}
