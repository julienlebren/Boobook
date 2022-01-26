[![@hikeland](https://img.shields.io/twitter/follow/hikeland?label=Hikeland&style=social)](https://twitter.com/hikeland)
![https://dart.dev/](https://img.shields.io/badge/Dart-2.0-blue)
![https://flutter.dev/](https://img.shields.io/badge/Flutter-2.0-blue)

# Boobook

This open-source project shows how to build a Flutter app with:
- [x] [Firebase Authentication](https://firebase.google.com/products/auth) to handle user authentication
- [x] [Firebase Firestore](https://firebase.google.com/products/firestore) for a reactive database
- [x] [Riverpod](https://pub.dev/packages/riverpod) to handle state management
- [x] [RevenueCat](https://www.revenuecat.com/) to configure in-app subscription easily
- [x] [ISBNdb](https://pub.dev/packages/isbndb_flutter) to fetch the books from their ISBN code

A lot of other topics are also covered by this project:
- [x] Learn the repository pattern architecture
- [x] Simple routing with homemade router (Navigator 1.0)
- [x] Use the dedicated OS components (**CupertinoScaffold** on iOS vs **Scaffold** on Android, for example)
- [x] Handle localization thanks to **flutter_localizations** and **Riverpod**
- [x] Reuse components through all your apps made with Flutter

![App preview](docs/app-screenshots.png)

## App Overview

Boobook is a simple book library manager designed for teachers, to manage book loans to pupils. 
The application is composed by five primary screens: **Loans**, **Books**, **Scan**, **Pupils**, and **Settings**.

On the first launch, the app asks the user to sign-in. This step can be skiped by selecting "Continue without account", which leads to the creation of an anonymous user on Firebase.

The **Loans** page displays the books which are currently loaned, with the remaining time before the expected return of the book. This time is displayed in green if it's far away, in orange for the last days, and in red if the date has been exceeded. Tap on a loan opens some options that allow you to end up the loan, or to extend it if needed.

Open the **Books** page to see the list of your books. A colored dot indicates whether the book is available or not. Tap on a book to edit its name or its cover picture.

In the **Pupils** page, you can see the list of your pupils, with the number of current loans. You can print all the membership cards at once by tapping on the top-right button. Tap on a pupil to edit his name or his card picture, or also to print his member card. 

Use the **Scan** page to open your device camera and be able to scan a book. If the book is not yet in your book list, you will be offered to add it, and if it's already added, you will be offered to scan a pupil card or pick a pupil in your list, to create a new loan.

Finally, the **Settings** page allows you to setup some features: the max number of simultaneous loans, the default duration for a loan, the title on the membership cards. Some appearance settings are also available, such as the default language displayed and the theming of the app (light or dark).

## Features

- Register all your books, by adding them manually or by scanning their barcode
- Create all your pupils, which will generate for you member cards that you can print out to give to your pupils
- Scan a book and a membership card to generate a loan in a few seconds! 
- Online data persistence with Firestore

## App Structure

The project folders are structured like this:

```
/controllers
/core
  /enums
  /models
/l10n
/presentation
  /common_widgets
  /routes
  /theme
  /views
    /home
      /codes
      /loans
      /pupils
      /scan
      /settings
      /subscription
    /sign_in
    /splash
/repositories
```
