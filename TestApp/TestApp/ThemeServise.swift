//
//  ThemeApp.swift
//  TestApp
//
//  Created by Даша Суворова on 5.10.25.
//

import Foundation
import SwiftUI

enum Theme: String, CaseIterable {
    case light
    case dark
    case system
    
    var id: String { rawValue }
    
    var colorScheme: ColorScheme? {
        switch self {
        case .light: return .light
        case .dark: return .dark
        case .system: return  .none
        }
    }
}


class ThemeServise: ObservableObject {
    @Published var currentTheme: Theme {
        didSet {
            UserDefaults.standard.set(currentTheme.rawValue, forKey: "appTheme")
        }
    }
    init() {
        if let saved = UserDefaults.standard.string(forKey: "appTheme"),
           let theme = Theme(rawValue: saved) {
            self.currentTheme = theme
        } else {
            self.currentTheme = .system
        }
    }
    
    func setTheme(_ theme: Theme) {
        currentTheme = theme
    }
}
