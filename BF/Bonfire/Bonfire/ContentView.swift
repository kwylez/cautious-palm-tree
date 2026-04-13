//
//  ContentView.swift
//  Bonfire
//
//  Created by Cory D. Wiles on 4/13/26.
//

import SwiftUI

struct ContentView: View {

    @Environment(ConditionStore.self) private var conditionStore

    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button("Open NorthStar") {
                if let url = URL(string: "northstar://") {
                    UIApplication.shared.open(url)
                }
            }
            .buttonStyle(.borderedProminent)

            if let condition = conditionStore.current {
                VStack(alignment: .leading, spacing: 8) {
                    Text(condition.name)
                        .font(.headline)
                    Text(condition.reading)
                        .font(.body)
                    Text("— \(condition.author)")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.horizontal)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environment(ConditionStore())
}
