# VeryCreatives_Challenge

An Flutter app challenge using TheMovieDB developer API.

## Installation
1. Run  flutter pub dev .
2. open main.dart file.
3. Run.

## Features
1. Popular Movies List Feature.

2. TopRated Movies List Feature.

3. Movies Details Feature.

4. Save Movies to the favorite list with SQFlite.

5. Open favorite screen when occurs a internet error.

6. Allow to change sort order.

## App Architecture

* Built using Clean Architecture, modularized in Data, Domain and Presentation.
* Unit testing was made with mocktail and bloc_test.

## Compatibility

* iPhone and Android.

## Third-party Dependencies

* Dio - Used for API calls.
* SQFlite - Used to create a database.
* Pull To Refresh - Used to refresh and infinite rolling list on Home Page.
* Connectivity - Used to check internet connection.
* Get it - Used to dependency injection.
* Equatable - Used to implement value base in some classes.
* Mocktail - Used to mock.
* Dartz - Used to throw left or right in the futures.
* Flutter Bloc - Used to state management.
* Bloc Test - Used to create state management unit test.
* Shared Preferences - Used to help create the database.


## Screenshots
| Splash Screen    | Home Screen       | Details Screen      | Favorites Screen   | 
|:----------------:|:-----------------:|:-------------------:|:------------------:|
|![splash-screen][]| ![home-screen][]  | ![details-screen][] |![favorites-screen][]|

[splash-screen]:https://gitlab.com/r1024/the-movie-db-flutter-app/-/blob/develop/themoviedb/sources/Screenshot_1636755449.png
[home-screen]: https://gitlab.com/r1024/the-movie-db-flutter-app/-/blob/develop/themoviedb/sources/Screenshot_1636755511.png
[details-screen]: https://gitlab.com/r1024/the-movie-db-flutter-app/-/blob/develop/themoviedb/sources/Screenshot_1636755565.png
[favorites-screen]: https://gitlab.com/r1024/the-movie-db-flutter-app/-/blob/develop/themoviedb/sources/Screenshot_1636755573.png