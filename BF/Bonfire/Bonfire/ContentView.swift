//
//  ContentView.swift
//  Bonfire
//
//  Created by Cory D. Wiles on 4/13/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
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
            .padding(.top)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
