//
//  TestAppApp.swift
//  TestApp
//
//  Created by Даша Суворова on 4.10.25.
//

import SwiftUI
import SwiftData

@main
struct TestAppApp: App {
    @StateObject private var themeServise = ThemeServise()
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(themeServise)
                .preferredColorScheme(themeServise.currentTheme.colorScheme)
                .modelContainer(for: [FavoriteProduct.self, CartProduct.self])
        }
    }
}
