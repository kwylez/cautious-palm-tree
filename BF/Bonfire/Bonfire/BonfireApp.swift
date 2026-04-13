//
//  BonfireApp.swift
//  Bonfire
//
//  Created by Cory D. Wiles on 4/13/26.
//

import SwiftUI

@Observable
final class ConditionStore {
    var current: Condition?

    func handle(url: URL) {
        guard url.scheme == "bonfire",
              url.host == "condition",
              let items = URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems
        else { return }

        let name = items.first(where: { $0.name == "name" })?.value ?? ""
        let reading = items.first(where: { $0.name == "reading" })?.value ?? ""
        let author = items.first(where: { $0.name == "author" })?.value ?? ""

        current = Condition(name: name, reading: reading, author: author)
    }
}

@main
struct BonfireApp: App {
    @State private var conditionStore = ConditionStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(conditionStore)
                .onOpenURL { url in
                    conditionStore.handle(url: url)
                }
        }
    }
}
