//
//  NorthStarShortcuts.swift
//  NorthStar
//
//  Created by Cory D. Wiles on 4/13/26.
//

import AppIntents

struct NorthStarShortcuts: AppShortcutsProvider {

    static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: CreateConditionIntent(),
            phrases: [
                "Create a condition in \(.applicationName)",
                "New condition in \(.applicationName)",
                "Add a condition in \(.applicationName)",
                "Send a condition to Bonfire with \(.applicationName)"
            ],
            shortTitle: "Create Condition",
            systemImageName: "plus.circle"
        )
    }
}
