//
//  Google.swift
//  TestApp
//
//  Created by Даша Суворова on 6.10.25.
//

import SwiftUI
import WebKit

struct Google: View {
    @Binding var selectedTab: Int
    @State private var isLoading = false
    @State private var progress = 0.0
    @State private var loadError = false
    
    private let url = URL(string: "https://www.google.com")!
    private let webView = WKWebView()
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 24) {
                Button {
                    webView.goBack()
                } label: {
                    Image(systemName: "chevron.backward")
                }
                .disabled(!webView.canGoBack)
                Button {
                    webView.goForward()
                } label: {
                    Image(systemName: "chevron.forward")
                }
                .disabled(!webView.canGoForward)
                Button {
                    webView.reload()
                } label: {
                    Image(systemName: "arrow.clockwise")
                }
                Spacer()
                Button {
                    selectedTab = 0
                } label: {
                    Image(systemName: "xmark")
                }
            }
            .padding()
            .background(.ultraThinMaterial)
            
            if isLoading {
                ProgressView(value: progress)
                    .progressViewStyle(.linear)
                    .tint(.blue)
                    .padding(.horizontal)
            }
            GoogleService(isLoading: $isLoading,
                    progress: $progress,
                    loadError: $loadError,
                    url: url,
                    webView: webView)
        }
        .navigationBarBackButtonHidden(true)
    }
}
