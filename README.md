# cautious-palm-tree

Two companion iOS apps — **Bonfire** and **NorthStar** — that demonstrate cross-app communication via deep links and Siri App Intents.

## Projects

| App | Path | URL Scheme |
|-----|------|------------|
| Bonfire | `BF/Bonfire/` | `bonfire://` |
| NorthStar | `NS/NorthStar/` | `northstar://` |

## What They Do

**NorthStar** is where conditions are created. A user can fill out a form (name, reading, and author) and send the resulting `Condition` to Bonfire. This can be triggered manually from within the app or hands-free via Siri.

**Bonfire** receives conditions from NorthStar, displays them, and exposes its own Siri intent for opening a specific condition by voice.

## The Condition Model

Both apps define a `Condition` struct independently:

```swift
struct Condition {
    let name: String
    let reading: String
    let author: String
}
```

Conditions are passed between apps as URL query parameters on the `bonfire://condition` deep link.

## Deep Linking

NorthStar opens Bonfire by constructing a URL of the form:

```
bonfire://condition?name=<name>&reading=<reading>&author=<author>
```

Bonfire's `ConditionStore` parses this URL on receipt (via SwiftUI's `onOpenURL`) and surfaces the condition in the UI.

## App Intents / Siri / Shortcuts

Both apps expose intents through Siri and the Shortcuts app. `AppShortcutsProvider` makes the intents pre-available in Shortcuts without any user configuration — they appear as tiles immediately after install and can be added to automations.

### NorthStar — `CreateConditionIntent`

Siri phrases:
- "Create a condition in NorthStar"
- "New condition in NorthStar"
- "Add a condition in NorthStar"
- "Send a condition to Bonfire with NorthStar"

Siri collects name, reading, and author conversationally, then opens Bonfire with the new condition via the `bonfire://` deep link.

### Bonfire — `OpenConditionIntent`

Siri phrases:
- "Open a condition in Bonfire"
- "Show a condition in Bonfire"
- "View a condition in Bonfire"

Siri collects the condition details and opens Bonfire directly to display them.

### Manual entry

Tapping **Create Condition** in NorthStar presents a SwiftUI `Form`. The **Send to Bonfire** button constructs the same `bonfire://condition` URL and opens Bonfire without involving Siri.

## Requirements

- Xcode 16+
- iOS 17+
- Swift 5.9+

## Getting Started

Open each project separately in Xcode:

```
BF/Bonfire/Bonfire.xcodeproj
NS/NorthStar/NorthStar.xcodeproj
```

To test the full flow, run both apps on the same simulator, then either tap **Create Condition** in NorthStar or invoke either Siri intent.
