//
//  EffectiveMobileApp.swift
//  EffectiveMobile
//
//  Created by Ariuna Banzarkhanova on 04/04/24.
//

import SwiftUI

@main
struct EffectiveMobileApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
                .preferredColorScheme(.dark)
        }
    }
}
