//
//  README.swift
//  FetchTakeHome
//
//  Created by camillo.de.martinis on 2/5/25.
//

# FetchTakeHome

FetchTakeHome is an iOS app that allows users to browse a list of recipes, view their details, and visit external links for more information. The app fetches recipe data from a remote API and displays the recipes with their names, cuisines, images, and external links for watching videos or viewing full recipes.

---

## Features

- Fetches a list of recipes from a remote API.
- Displays the recipe name, cuisine, and images dynamically.
- Provides links to external sources such as recipes and YouTube videos for each value that returns.
- Built using SwiftUI

### Prerequisites

- Xcode 12 or later
- Swift 5.0+
- CocoaPods or Swift Package Manager for dependency management (if applicable)

## Usage

When you first run the app, it will auto fetch a list of recipes from the API in the code and from there display them in a list. You can refresh the list by pressing the refresh icon, and each recipe will display the name, image, and kind of cuisine along with a link or video of the recipe.

### How to Use the App
1. Open the app on your iOS device or simulator.
2. Once the app loads, you will see a list of recipes.
3. Tap on a recipe to view more details, including links to the full recipe which will take you outside the app and the YouTube video.
4. You can also refresh the list of recipes by clicking the refresh icon on the home screen near the top.

---

## Testing

This project includes unit tests and UI tests using XCTest. To run the tests:

1. Open the project in Xcode.
2. Press *Cmd + U* to run all tests or navigate to the project navigator and  switch to the test navigator to easily click on an individual test to run

