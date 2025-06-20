//
//  ContentView.swift
//  ModelActorPractice
//
//  Created by 신승재 on 6/20/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \Note.createdAt, order: .reverse) private var notes: [Note]
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            
            // MARK: - TextField & Button
            HStack {
                TextField("", text: $text)
                    .textFieldStyle(.roundedBorder)
                
                Button {
                    let note = Note(content: text)
                    context.insert(note)
                    text = ""
                } label: {
                    Text("저장")
                }.buttonStyle(.borderedProminent)
            }.padding(.horizontal, 24)
            
            // MARK: - List
            List {
                ForEach(notes) {
                    Text($0.content)
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Note.self)
}
