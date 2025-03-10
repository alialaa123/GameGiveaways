## # Game Giveaways
This project is a demonstration of modern iOS development practices, MVVM architecture, Clean Architecture, and SwiftUI for building a scalable and maintainable application. 
The project also incorporates advanced patterns such as Repository Pattern, Dependency Injection, Coordinator Pattern, and Combine Framework for reactive programming.

##### Project Overview
The app is showing List of Game giveaways, with filtering by platforms, You can tap for any giveaway to show you more details about it.

API of this project not support pagination, and to avoid bad performance and lagging that could happen for large data, list is implemented 
using lazyVStack so It only load the appearing Items in memory and avoid loading more items, specially for Images.


##### Architecture and Patterns
###### 1. MVVM Architecture
The project follows the Model-View-ViewModel (MVVM) pattern to separate the UI logic from the business logic.

**view:** Built entirely using SwiftUI, ensuring a declarative and modern UI approach.

**ViewModel:** Contains the business logic and communicates with the View through published properties and Combine framework for reactive updates.

**Model:** Represents the data layer, including entities and data transfer objects (DTOs).

###### 2. Clean Architecture
The project adheres to **Clean Architecture** principles to ensure a clear separation of concerns:

**Domain Layer:** Centralizes the business logic, making it independent of the UI and data layers.

**Data Layer:** Handles data retrieval and persistence, including network requests and local storage.

**Presentation Layer:** Manages the UI and user interactions, leveraging SwiftUI and Combine.

###### 3. Repository Pattern
The Repository Pattern is used to abstract the data layer, providing a single source of truth for data access. This ensures that the domain layer remains agnostic of the data source (e.g., network or local database).

###### 4. Dependency Injection (DI)
Dependency Injection is implemented to manage dependencies across the app. This promotes loose coupling, testability, and modularity. Each component (e.g., ViewModel, Repository) receives its dependencies via initializers.

###### 5. Coordinator Pattern
The Coordinator Pattern is used to manage navigation and flow control. This decouples navigation logic from the views and view models, making the app more modular and easier to maintain.

###### 6. Combine Framework
The Combine framework is used for reactive programming, enabling the View to observe changes in the ViewModel through published properties. This ensures a seamless and reactive data flow between the View and ViewModel.

###### 7. Factory Pattern
The Factory Pattern is utilized to create instances of UITabBarController and its associated components. This pattern ensures that each tab is initialized with its own UINavigationController, Coordinator, and Dependency Injection setup.

###### 8. Concurrency with Sendable
The project leverages Swift's modern concurrency features, including Sendable, to ensure thread-safe data handling and improve performance.

#### Project Structure
The project is organized into the following modules:

###### 1. Domain Layer
Contains the core business logic and use cases.

Defines entities and protocols for data access.

###### 2. Data Layer
Implements the repository pattern.

Handles network requests and data persistence.

###### 3. Presentation Layer
Contains SwiftUI views and view models.

Manages UI logic and user interactions.

###### 4. Coordinators
Handles navigation and flow control.

Decouples navigation logic from views and view models.

###### 5. Dependency Injection
Manages dependencies across the app.

Ensures modularity and testability.

###### 6. Utilities
Contains shared utilities, extensions, and helper functions.

#### Key Features
###### 1. Generic Components
Most of the views created as small components with a lot of optional properties so it can be generic for many cases.

### For the Real implemenations I would go with not a fully customized components if they are not as same as the design, but for the puprose of this Task I go with one generic component for card view

###### 2. Reactive Communication
The View and ViewModel communicate through published properties and Combine.

The View listens to changes in the ViewModel and triggers actions accordingly.

###### 3. Protocol-Oriented Communication
Communication between the ViewModel and View is facilitated through protocols, ensuring a clear and decoupled interaction.

###### 4. Scalable Navigation
The Coordinator Pattern ensures scalable and maintainable navigation logic.

Navigation is decoupled from the views and view models, making it easier to modify or extend.

#### Future Improvements
While the current implementation meets the requirements, the following improvements could be considered for a production-ready app:

**Enhanced Error Handling:** Implement robust error handling.

**Unit and UI Testing:** Add comprehensive unit tests for all viewModels, maybe also add unit test for Domain layer

**Localization and Accessibility:** Support multiple languages and ensure accessibility compliance.

###### Technologies and Tools
**SwiftUI:** For building declarative and modern UIs.

**Combine:** For reactive programming and data binding.

**Dependency Injection:** For managing dependencies.

**Coordinator Pattern:** For navigation management.

**Factory Pattern:** For creating instances of components.

**Clean Architecture:** For separation of concerns and scalability.
