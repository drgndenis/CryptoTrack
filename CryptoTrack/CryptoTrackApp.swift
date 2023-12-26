//
//  CryptoTrackApp.swift
//  CryptoTrack
//
//  Created by Denis DRAGAN on 30.11.2023.
//

import SwiftUI

@main
struct CryptoTrackApp: App {
    @StateObject private var vm = HomeViewModel()
    
    init() {
        // Customize the appearance of navigation bar titles when the app is launched
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
            }
            .environmentObject(HomeViewModel())
        }
    }
}
