//
//  QuickCab2App.swift
//  QuickCab2
//
//  Created by Naishe Rowland  on 10/24/25.
//

import SwiftUI

@main
struct QuickCab2App: App {
    @StateObject var locationViewModel = LocationSearchViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationViewModel)
        }
    }
}
