# flutter_application_2

This application demonstrates a simple two-screen flow using the Flutter framework and manages its state through the flutter_bloc package.

Before running the project, ensure that you have installed:

Flutter SDK version >= 3.x.x

Dart SDK compatible with your Flutter installation

To check your current versions, use these commands in terminal: flutter --version

Installation

Clone or download the repository from GitHub:

    git clone https://github.com/Tiremir/flutter_application_2.git

    cd flutter_application_2

Install all necessary packages by executing:

    flutter pub get

Running the Project

Run the application either directly within an IDE like Android Studio or Visual Studio Code, or via command line: flutter run.
The application will be launched on the default emulator or connected device.

Usage Overview

The first screen prompts users for input describing what they would like to see.
After submitting valid input, it navigates to the second screen where a loader appears followed by a placeholder image after some delay.
Users can retry generating images or return back to edit their initial prompt.

Testing Steps

Open the app.
Enter any description into the field provided.
Click "Generate."
Observe the transition to the next screen with the loading animation.
Try different actions such as "Try Another," "New Prompt," etc., to verify functionality.
