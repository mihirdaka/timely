//
//  JournalViewModel.swift
//  Timely
//
//  Created by Mihir Daka on 6/27/25.
//


import Foundation
import Combine

struct JournalEntry: Identifiable, Codable {
    let id: UUID
    let date: Date
    let text: String
}



class JournalViewModel: ObservableObject {
    @Published var entries: [JournalEntry] = []

    init() {
        loadEntries()
    }
    
    func deleteEntry(at offsets: IndexSet) {
        entries.remove(atOffsets: offsets)
        saveEntries()
    }


    func addEntry(text: String) {
        let newEntry = JournalEntry(id: UUID(), date: Date(), text: text)
        entries.insert(newEntry, at: 0)
        saveEntries()
    }

    private func saveEntries() {
        if let data = try? JSONEncoder().encode(entries) {
            UserDefaults.standard.set(data, forKey: "journal_entries")
        }
    }

    private func loadEntries() {
        if let data = UserDefaults.standard.data(forKey: "journal_entries"),
           let saved = try? JSONDecoder().decode([JournalEntry].self, from: data) {
            entries = saved
        }
    }
}
