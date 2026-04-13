//
//  ContentView.swift
//  NorthStar
//
//  Created by Cory D. Wiles on 4/13/26.
//

import SwiftUI

struct ContentView: View {

    @State private var showingForm = false

    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("NorthStar")
            Button("Create Condition") {
                showingForm = true
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .sheet(isPresented: $showingForm) {
            ConditionFormView()
        }
        .onOpenURL { url in
            print("Received deep link: \(url)")
        }
    }
}

#Preview {
    ContentView()
}
