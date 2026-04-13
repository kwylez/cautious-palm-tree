//
//  OpenConditionIntent.swift
//  Bonfire
//
//  Created by Cory D. Wiles on 4/13/26.
//

import AppIntents

struct OpenConditionIntent: AppIntent {

    static var title: LocalizedStringResource = "Open Condition in Bonfire"
    static var description = IntentDescription(
        "View a condition in Bonfire.",
        categoryName: "View"
    )

    @Parameter(
        title: "Name",
        description: "The name of the condition.",
        requestValueDialog: IntentDialog("What is the name of the condition?")
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
            throw OpenConditionError.invalidURL
        }

        return .result(
            opensIntent: OpenURLIntent(url), dialog: IntentDialog("Opening '\(name)' by \(author) in Bonfire.")
        )
    }
}

private enum OpenConditionError: Error {
    case invalidURL
}
