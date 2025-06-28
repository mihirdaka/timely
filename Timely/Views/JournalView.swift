//
//  JournalView.swift
//  Timely
//
//  Created by Mihir Daka on 6/27/25.
//


import SwiftUI

struct JournalView: View {
    @StateObject private var viewModel = JournalViewModel()
    @State private var newText = ""

    var body: some View {
        VStack {
            
            VStack(alignment: .leading) {
                Text("New Journal Entry")
                    .font(.headline)

                
                TextField("Type", text: $newText)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                

                Button("Save Entry") {
                    guard !newText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
                    viewModel.addEntry(text: newText)
                    newText = ""
                }
                
                .frame( alignment: .trailing)
                .foregroundColor(.white)
                .padding(.vertical, 8)
                .padding(.horizontal)
                .background(AppTheme.primaryColor)
                .cornerRadius(10)
            }
            .padding()

            Divider()

            
            List {
                ForEach(viewModel.entries) { entry in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(entry.text)
                            .font(.body)
                        Text(formatDate(entry.date))
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 4)
                }
                .onDelete(perform: viewModel.deleteEntry)
            }
        }
        .navigationTitle("Journal")
        .preferredColorScheme(.light)
    }

    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}
