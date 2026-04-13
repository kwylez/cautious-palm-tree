# NorthStar

An iOS app built with SwiftUI.

## Overview

NorthStar is the companion app to [Bonfire](../../BF/Bonfire/README.md). It registers the `northstar://` custom URL scheme so it can be launched directly from Bonfire via a deep link.

## Features

- Handles incoming deep links via the `northstar://` URL scheme
- `Condition` model with `name`, `reading`, and `author` properties

## Requirements

- Xcode 16+
- iOS 17+
- Swift 5.9+

## Getting Started

1. Open `NS/NorthStar/NorthStar.xcodeproj` in Xcode.
2. Select a simulator or device.
3. Build and run (`Cmd+R`).

> To test the deep link, run both NorthStar and Bonfire on the same simulator, then tap **Open NorthStar** in Bonfire.

## URL Scheme

NorthStar registers the `northstar` URL scheme in `Info.plist`. Incoming URLs are handled in `ContentView` via the SwiftUI `.onOpenURL` modifier.

| Scheme | Example URL |
|--------|-------------|
| `northstar` | `northstar://` |

## Project Structure

```
NorthStar/
├── NorthStarApp.swift     # App entry point
├── ContentView.swift      # Main view with onOpenURL handler
├── Condition.swift        # Condition model (name, reading, author)
├── Info.plist             # URL scheme registration
└── Assets.xcassets/       # App icons and accent color
```
