//
//  ContentView.swift
//  NorthStar
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
        }
        .padding()
        .onOpenURL { url in
            // Handle incoming deep link from Bonfire
            print("Received deep link: \(url)")
        }
    }
}

#Preview {
    ContentView()
}
