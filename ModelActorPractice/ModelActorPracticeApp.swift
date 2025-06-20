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
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: Note.self)
    }
}
