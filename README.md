# Contacts SwiftUI

Welcome to the demo project of architecture for the application built with the SwiftUI.

The main idea of the project is a creation of the iOS app in accordance to Clean Architecture recommendations and SOLID, DRY, KISS principles.

Inspired by [Clean Architecture for SwiftUI](https://nalexn.github.io/clean-architecture-swiftui/?utm_source=nalexn_github) article.

[![Build Status](https://travis-ci.org/Morheit/contacts-swiftui.svg?branch=master)](https://travis-ci.org/Morheit/contacts-swiftui) [![codecov](https://codecov.io/gh/Morheit/contacts-swiftui/branch/master/graph/badge.svg)](https://codecov.io/gh/Morheit/contacts-swiftui) [![codebeat badge](https://codebeat.co/badges/540330a9-e112-457c-a93f-46ac1fb22f38)](https://codebeat.co/projects/github-com-morheit-contacts-swiftui-master)

## Overview

The App has "People" and "Detailed Info" screens. The "People" screen shows basing on view mode the list of people with names and images or just the grid of images. The images are [Gravatar Default Images](https://en.gravatar.com/site/implement/images/) which downloaded and cached using the [SDWebImage](https://github.com/SDWebImage/SDWebImage) library. The "Detailed Info" screen opens after tapping on a cell and shows the chosen person details including: Image, Name, Email. On **Simulate Changes** button press the application model is randomly changes every second.

<img src="https://github.com/Morheit/contacts-swiftui/blob/master/.github/People_Screen_List.png" width="400" height="750"/>
<img src="https://github.com/Morheit/contacts-swiftui/blob/master/.github/People_Screen_Grid.png" width="400" height="750"/>
<img src="https://github.com/Morheit/contacts-swiftui/blob/master/.github/Detailed_Info_Screen.png" width="400" height="750"/>

## Architecture

To be added

# Dependencies

The project uses the following dependencies:

* [QGrid](https://github.com/Q-Mobile/QGrid)
* [SDWebImage](https://github.com/SDWebImage/SDWebImage)

The dependencies are installed via the [Swift Package Manager](https://swift.org/package-manager/).

## TODO's

* Coverage of remaining UT
* Documentation adding
* `TODO` keywords elimination
