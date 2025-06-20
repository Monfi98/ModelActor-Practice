//
//  SwiftDataStorage.swift
//  ModelActorPractice
//
//  Created by 신승재 on 6/20/25.
//

import Foundation
import SwiftData

final class SwiftDataStorage {
  let modelContainer = {
    let schema = Schema([Note.self])
      
    let configuration = ModelConfiguration(
      isStoredInMemoryOnly: true
    )
    
    do {
      let container = try ModelContainer(
        for: schema,
        configurations: configuration
      )
      return container
    } catch {
      fatalError("Model Container error")
    }
  }()
}
