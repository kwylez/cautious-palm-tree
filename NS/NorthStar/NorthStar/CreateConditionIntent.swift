//
//  CreateConditionIntent.swift
//  NorthStar
//
//  Created by Cory D. Wiles on 4/13/26.
//

import AppIntents

struct CreateConditionIntent: AppIntent {

    static var title: LocalizedStringResource = "Create a Condition"
    static var description = IntentDescription(
        "Create a new condition and send it to Bonfire.",
        categoryName: "Create"
    )

    @Parameter(
        title: "Name",
        description: "The name of the condition.",
        requestValueDialog: IntentDialog("What should the condition be named?")
    )
    var name: String

    @Parameter(
        title: "Reading",
        description: "The reading associated with the condition.",
        requestValueDialog: IntentDialog("What is the reading?")
    )
    var reading: String

    @Parameter(
        title: "Author",
        description: "The author of the reading.",
        requestValueDialog: IntentDialog("Who is the author?")
    )
    var author: String

    func perform() async throws -> some IntentResult & ProvidesDialog & OpensIntent {
        var components = URLComponents()
        components.scheme = "bonfire"
        components.host = "condition"
        components.queryItems = [
            URLQueryItem(name: "name", value: name),
            URLQueryItem(name: "reading", value: reading),
            URLQueryItem(name: "author", value: author)
        ]

        guard let url = components.url else {
            throw CreateConditionError.invalidURL
        }

        return .result(
            opensIntent: OpenURLIntent(url), dialog: IntentDialog("Created '\(name)' by \(author). Opening Bonfire now.")
        )
    }
}

private enum CreateConditionError: Error {
    case invalidURL
}
