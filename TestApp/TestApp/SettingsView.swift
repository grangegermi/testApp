//
//  Settingsview.swift
//  TestApp
//
//  Created by Даша Суворова on 5.10.25.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var themeServise: ThemeServise
    var body: some View {
        NavigationStack {
            ZStack {
                Color.appBackround.ignoresSafeArea()
                VStack {
                    Picker("Theme", selection: $themeServise.currentTheme) {
                        ForEach(Theme.allCases, id: \.self) { theme in
                            Text(theme.rawValue.capitalized).tag(theme)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    Spacer()
                }
            }
            .navigationTitle("Settings")
        }
        
    }
}

#Preview {
    SettingsView()
}
