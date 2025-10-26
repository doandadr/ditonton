# Ditonton

Ditonton is a Flutter-based movie and TV show catalog application. It showcases a wide range of films and television series, allowing users to discover new, popular, top-rated, and currently airing content. This project is built using modern Flutter development practices, focusing on a clean architecture and a scalable structure .The application fetches all its data from The Movie Database (TMDB) API.

## Built With

Here are the technologies and libraries used to create this project:
- Framework and Language: Flutter
  - Flutter v3.35.5
  - Dart v3.9.2
- State Management: 
  - flutter_bloc v8.1.3
  - Provider v6.1.1
- Dependency Injection:
  - get_it v7.6.7
- Networking:
  - http v1.2.0
- Backend and Monitoring:
  - firebase_core v2.24.2
  - firebase_crashlytics v3.4.9
- Testing & Code Generation:
  - flutter_test 
  - bloc_test v9.0.0
  - mockito v5.4.4
  - integration_test 
  - build_runner v2.4.8
- Code Quality:
  - flutter_lints v3.0.1

## Project Structure & Architecture
The application is modularized into four distinct local modules to facilitate separation of concerns and reusability.
- core: Contains shared logic, base classes, and utilities.
- movie: Handles all features related to movies.
- tv: Handles all features related to TV shows
- about: Contains the about page

The project is built using the Clean Architecture to ensure the codebase is separated into distinct layers, promoting scalability, maintainability, and testability.

## Documentation

<table>
  <tr align="center">
    <th>Movie Home Screen</th>
    <th>Top Rated Movies</th>
    <th>Movie Search</th>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/53fd7106-4e3b-4b89-a284-424a6d7eec62" alt="Welcome Screen" width="300"></td>
    <td><img src="https://github.com/user-attachments/assets/cd492626-92fe-41ba-91fb-ff751e45a3a8" alt="Login" width="300"></td>
    <td><img src="https://github.com/user-attachments/assets/10f03789-13e7-4944-a61a-48c6db64cd6e" alt="Register" width="300"></td>
  </tr>
    <tr align="center">
    <th>Movie Detail</th>
    <th>Movie Detail (Extended)</th>
    <th>Movie Added to Watchlist</th>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/eeb607ed-cc71-41f8-a365-bf654fb2c77a" width="300"></td>
    <td><img src="https://github.com/user-attachments/assets/1ec6da0a-9f91-4ea3-a951-2b1f9144c931" alt="Pantry (Empty)" width="300"></td>
    <td><img src="https://github.com/user-attachments/assets/9c1d86a6-1732-4116-a2d7-c6ad55ef1b33" alt="Pantry (Filled)" width="300"></td>
  </tr>
    </tr>
    <tr align="center">
    <th>Movie Watchlist</th>
    <th>Sidebar</th>
    <th>TV Home Screen</th>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/ff95e0c3-421c-4cb1-a78f-5e74022d9fbf" alt="Recipes (Filled)" width="300"></td>
    <td><img src="https://github.com/user-attachments/assets/8f41eece-7ea0-40e5-9c0c-76adf463b775" alt="Recipe Detail (Description)" width="300"></td>
    <td><img src="https://github.com/user-attachments/assets/e2ea2832-2681-48a3-898b-8b03311c1fbb" alt="Recipe Detail (Ingredients)" width="300"></td>
  </tr>
  </tr>
    <tr align="center">
    <th>TV Series On The Air</th>
    <th>TV Series Detail</th>
    <th>TV Series Detail (Extended)</th>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/4caa77fd-8e41-4011-8136-ac04c97b73ca" alt="Ingredient Detection" width="300"></td>
    <td><img src="https://github.com/user-attachments/assets/f0b59d1f-721b-4c0b-87b6-5f8edff1fc07" alt="Ingredient Photo Capture" width="300"></td>
    <td><img src="https://github.com/user-attachments/assets/c42552bc-67ee-44cf-a48f-e9a6a4cc9c2b" alt="Ingredient Detected" width="300"></td>
  </tr>
</table>


## CI build

### Android
[![Codemagic build status](https://api.codemagic.io/apps/65b49d75096b83ab0fc8d71c/android-workflow/status_badge.svg)](https://codemagic.io/apps/65b49d75096b83ab0fc8d71c/android-workflow/latest_build)

### iOS
[![Codemagic build status](https://api.codemagic.io/apps/65b49d75096b83ab0fc8d71c/ios-workflow/status_badge.svg)](https://codemagic.io/apps/65b49d75096b83ab0fc8d71c/ios-workflow/latest_build)
