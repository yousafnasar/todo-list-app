# To-Do List App

## Project Overview
The To-Do List App is a mobile application developed using Flutter that allows users to manage their daily tasks efficiently. Users can add, edit, delete, and mark tasks as completed. The app is integrated with Firebase for user authentication and data storage, ensuring that users can access their tasks from any device.

## Features
- **User Authentication**: Users can register, log in, and manage their accounts securely using Firebase Authentication.
- **Task Management**: Users can create, edit, delete, and mark tasks as completed.
- **Real-Time Data Sync**: Tasks are stored in Firestore, allowing real-time updates across devices.
- **Responsive Design**: The app is designed to work seamlessly on various screen sizes with a user-friendly interface.
- **Onboarding Screens**: New users are guided through the app's features with onboarding screens.

## Tools and Technologies Used
- **Flutter**: Framework for building the mobile application.
- **Firebase**: Backend service for authentication and database management.
- **GetX**: State management solution used in the application.
- **Provider**: Additional state management for navigation.
- **Dart**: Programming language used to develop the application.

## Code Structure
The project follows the **MVVM (Model-View-ViewModel)** design pattern:
- **Models**: Contains data structures and business logic (e.g., `Task`).
- **Views**: UI components (e.g., screens like `HomeScreen`, `LoginScreen`).
- **ViewModels**: Controllers that handle user input and interact with models (e.g., `TaskController`).

### Directory Structure

todo_list_app/
├── lib/
│ ├── controllers/
│ │ ├── task_controller.dart
│ ├── models/
│ │ ├── task.dart
│ ├── screens/
│ │ ├── home_screen.dart
│ │ ├── login_screen.dart
│ │ ├── registration_screen.dart
│ │ ├── onboarding_screen.dart
│ ├── repository/
│ │ ├── authentication_repository.dart
│ └── main.dart
└── pubspec.yaml

## Mockups
![App Mockup](assets\images\freepik__upload__98650.png)  <!-- Adjust the path as necessary -->

### Design Explanation
The app's design focuses on simplicity and usability, featuring intuitive navigation and clear calls to action. The onboarding process guides users through essential features, ensuring they understand how to use the app effectively.

## Video Demo
[Watch the video demonstration here](https://www.youtube.com/watch?v=your_video_link)  <!-- Replace with your actual video link -->

