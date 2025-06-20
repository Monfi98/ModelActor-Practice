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
    
    private let modelActor: ModelActorExample
    
    init() {
        let storage = SwiftDataStorage()
        self.modelActor = ModelActorExample(modelContainer: storage.modelContainer)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(modelActor: modelActor)
        }
    }
}
