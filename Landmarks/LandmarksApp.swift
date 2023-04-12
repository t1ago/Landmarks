//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Tiago Henrique Piantavinha on 03/04/23.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
