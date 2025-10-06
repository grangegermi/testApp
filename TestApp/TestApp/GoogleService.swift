//
//  GoogleService.swift
//  TestApp
//
//  Created by Даша Суворова on 6.10.25.
//

import Foundation
import WebKit
import SwiftUI

struct GoogleService: UIViewRepresentable {
    @Binding var isLoading: Bool
    @Binding var progress: Double
    @Binding var loadError: Bool
    
    let url: URL
    let webView: WKWebView
    
    func makeUIView(context: Context) -> WKWebView {
        webView.navigationDelegate = context.coordinator
        webView.allowsBackForwardNavigationGestures = true
        
        webView.addObserver(context.coordinator,
                            forKeyPath: #keyPath(WKWebView.estimatedProgress),
                            options: .new,
                            context: nil)
        if webView.url == nil {
            webView.load(URLRequest(url: url))
        }
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: GoogleService
        
        init(_ parent: GoogleService) {
            self.parent = parent
        }
        
        override func observeValue(forKeyPath keyPath: String?, of object: Any?,
                                   change: [NSKeyValueChangeKey : Any]?,
                                   context: UnsafeMutableRawPointer?) {
            guard keyPath == "estimatedProgress",
                  let webView = object as? WKWebView else { return }
            
            DispatchQueue.main.async {
                self.parent.progress = webView.estimatedProgress
            }
        }
        
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            parent.isLoading = true
            parent.loadError = false
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            parent.isLoading = false
        }
        
        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            parent.isLoading = false
            parent.loadError = true
        }
        
        func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
            parent.isLoading = false
            parent.loadError = true
        }
    }
}
