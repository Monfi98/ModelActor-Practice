//
//  ModelActorProvider.swift
//  ModelActorPractice
//
//  Created by 신승재 on 6/20/25.
//

import Foundation

@Observable
final class ModelActorProvider {
    
    var modelActor: ModelActorExample? = nil
    
    func createModelActor() async {
        let storage = SwiftDataStorage()
        let modelActor = ModelActorExample(modelContainer: storage.modelContainer)
        await MainActor.run { self.modelActor = modelActor }
    }
}
