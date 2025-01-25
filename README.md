Project Overview:

This repository contains a Flutter application featuring user authentication (login and sign-up), a dashboard/home screen, and a person screen. The app is developed using the GetX state management library, with proper validations and internet connectivity handling. API integration has been implemented to fetch and manage data effectively.


Features:

Login and Sign-up: User authentication with form validations.
Dashboard/Home Screen: Displays key app features and data.
Person Screen: Displays details of an individual user.
API Integration: Seamless handling of GET API requests, including error handling.
Internet Connectivity Handling: Ensures smooth operation in offline scenarios.


Packages Used:

GetX: For state management and navigation.
connectivity_plus: To monitor internet connectivity.
country_code_picker_plus: For selecting country codes during sign-up or phone input.
http: For API requests and response handling.
flutter_spinkit: For loading animations.


Setup Instructions: 

  Prerequisites:
Flutter SDK installed (version 3.10 or higher is recommended).
A code editor such as VS Code or Android Studio.
An active internet connection.

  Steps to Run the App

Clone the repository: git clone <usmandeveloper007/speedforce_task>
Navigate to the project directory: cd <speedforce_task>
Install dependencies: flutter pub get
Run the application: flutter run
Ensure a connected emulator or physical device.


Architectural and Design Decisions:

State Management: GetX was chosen for its simplicity and reactivity, ensuring smooth state transitions.
API Service Class: A dedicated service class was implemented to manage API calls and handle exceptions. This separates business logic from UI, adhering to the principles of clean architecture.
Validation: Form validation logic was placed directly within controllers to ensure data integrity before API interactions.
Internet Connectivity: The connectivity_plus package monitors internet status and provides user-friendly messages when connectivity is lost.
