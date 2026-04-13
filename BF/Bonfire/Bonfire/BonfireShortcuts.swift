//
//  BonfireShortcuts.swift
//  Bonfire
//
//  Created by Cory D. Wiles on 4/13/26.
//

import AppIntents

struct BonfireShortcuts: AppShortcutsProvider {

    static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: OpenConditionIntent(),
            phrases: [
                "Open a condition in \(.applicationName)",
                "Show a condition in \(.applicationName)",
                "View a condition in \(.applicationName)"
            ],
            shortTitle: "Open Condition",
            systemImageName: "doc.text.magnifyingglass"
        )
    }
}
