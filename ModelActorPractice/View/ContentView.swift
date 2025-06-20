//
//  ContentView.swift
//  ModelActorPractice
//
//  Created by 신승재 on 6/20/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State private var notes: [Note] = []
    @State private var text: String = ""
    
    private let modelActor: ModelActorExample
    
    init(modelActor: ModelActorExample) {
        self.modelActor = modelActor
    }
    
    var body: some View {
        VStack {
            
            // MARK: - TextField & Button
            HStack {
                TextField("", text: $text)
                    .textFieldStyle(.roundedBorder)
                
                Button {
                    Task {
                        await modelActor.createNote(content: text)
                        await MainActor.run { self.text = "" }
                        
                        await updateList()
                    }
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
        .task {
            await updateList()
        }
    }
    
    private func updateList() async {
        let datas = await modelActor.fetchNotes()
        await MainActor.run { self.notes = datas }
    }
}

//#Preview {
//    let storage = SwiftDataStorage()
//    ContentView(modelActor: ModelActorExample(modelContainer: storage.modelContainer))
//}
