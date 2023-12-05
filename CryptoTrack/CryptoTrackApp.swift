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
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
            }
            .environmentObject(HomeViewModel())
        }
    }
}
