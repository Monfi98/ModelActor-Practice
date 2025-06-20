//
//  Note.swift
//  ModelActorPractice
//
//  Created by 신승재 on 6/20/25.
//

import Foundation
import SwiftData

@Model
final class Note {
    @Attribute(.unique) var id: UUID
    var content: String
    var createdAt: Date

    init(content: String) {
        self.id = UUID()
        self.content = content
        self.createdAt = Date()
    }
}
