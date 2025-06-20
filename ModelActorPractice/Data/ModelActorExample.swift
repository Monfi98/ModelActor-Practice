//
//  ModelActorExample.swift
//  ModelActorPractice
//
//  Created by 신승재 on 6/20/25.
//

import Foundation
import SwiftData

@ModelActor
actor ModelActorExample {
    
    func createNote(content: String) {
        let note = Note(content: content)
        modelContext.insert(note)
        try? modelContext.save()
    }
    
    func fetchNotes() -> [Note] {
        let sortDescriptor = SortDescriptor(\Note.createdAt, order: .reverse)
        let descriptor = FetchDescriptor<Note>(sortBy: [sortDescriptor])
        
        guard let data = try? modelContext.fetch(descriptor) else { return [] }
        return data
    }
}
