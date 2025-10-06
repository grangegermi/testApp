//
//  MainTab.swift
//  TestApp
//
//  Created by Даша Суворова on 5.10.25.
//

import SwiftUI
import SwiftData

struct MainTabView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack {
                ContentView()
            }
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }
            .tag(0)
            NavigationStack {
                 Favorites()
            }
            .tabItem {
                Label("Favorites", systemImage: "heart.fill")
            }
            .tag(1)
            NavigationStack {
                TrashView()
            }
            .tabItem {
                Label("Cart", systemImage: "trash.fill")
            }
            .tag(2)
            
            NavigationStack {
                Google(selectedTab: $selectedTab)
            }
            .tabItem {
                Label("Google", systemImage: "network")
            }
            .tag(3)
            NavigationStack {
                SettingsView()
            }
            .tabItem {
                Label("Settings", systemImage: "gearshape.fill")
            }
            .tag(4)
        }
        .accentColor(.black)
    }
}

