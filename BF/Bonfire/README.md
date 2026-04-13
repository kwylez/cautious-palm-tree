# Bonfire

An iOS app built with SwiftUI.

## Overview

Bonfire demonstrates cross-app deep linking on iOS. It includes a button that launches the companion [NorthStar](../../NS/NorthStar/README.md) app via a custom URL scheme.

## Features

- Deep link to NorthStar via the `northstar://` URL scheme
- `Condition` model with `name`, `reading`, and `author` properties

## Requirements

- Xcode 16+
- iOS 17+
- Swift 5.9+

## Getting Started

1. Open `BF/Bonfire/Bonfire.xcodeproj` in Xcode.
2. Select a simulator or device.
3. Build and run (`Cmd+R`).

> To test the deep link, run both Bonfire and NorthStar on the same simulator, then tap **Open NorthStar** in Bonfire.

## Project Structure

```
Bonfire/
├── BonfireApp.swift       # App entry point
├── ContentView.swift      # Main view with deep link button
├── Condition.swift        # Condition model (name, reading, author)
└── Assets.xcassets/       # App icons and accent color
```
