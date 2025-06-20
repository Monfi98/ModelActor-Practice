//
//  ModelActorPracticeApp.swift
//  ModelActorPractice
//
//  Created by 신승재 on 6/20/25.
//

import SwiftUI
import SwiftData

@main
struct ModelActorPracticeApp: App {
    
    @State private var modelActorProvider = ModelActorProvider()
    
    var body: some Scene {
        WindowGroup {
            if let modelActor = modelActorProvider.modelActor {
                ContentView(modelActor: modelActor)
            } else {
                Color.white.ignoresSafeArea()
                    .task {
                        await modelActorProvider.createModelActor()
                    }
            }
        }
    }
}
