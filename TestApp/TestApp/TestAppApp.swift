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
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .modelContainer(for: FavoriteProduct.self)
        }
    }
}
