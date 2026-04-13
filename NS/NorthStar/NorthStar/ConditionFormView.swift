//
//  ConditionFormView.swift
//  NorthStar
//
//  Created by Cory D. Wiles on 4/13/26.
//

import SwiftUI

struct ConditionFormView: View {

    @State private var name = ""
    @State private var reading = ""
    @State private var author = ""
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            Form {
                Section("Details") {
                    TextField("Name", text: $name)
                    TextField("Reading", text: $reading)
                    TextField("Author", text: $author)
                }
            }
            .navigationTitle("New Condition")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Send to Bonfire") { send() }
                        .disabled(name.isEmpty || reading.isEmpty || author.isEmpty)
                }
            }
        }
    }

    private func send() {
        let condition = Condition(name: name, reading: reading, author: author)
        Task { await CreateConditionIntent.send(condition) }
        dismiss()
    }
}
