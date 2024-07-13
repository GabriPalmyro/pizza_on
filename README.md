# Flutter White Label Pizza App

This repository contains a Flutter app for a white label pizza ordering system. The purpose of this project is to study dependency injection and white label monorepo apps.

## Getting Started

To open the base_app, follow these steps:

1. Access the `apps/base_app` directory.
2. Run `flutter pub get` to install the required dependencies.
3. Finally, run `flutter run` to launch the app.

## Project Structure

The project follows a monorepo structure, with multiple apps sharing a common codebase. Here's an overview of the directory structure:

- `apps/base_app`: The base app that serves as the foundation for white labeling.
- `apps/white_label_app1`: The first white label app, customized for a specific pizza chain.
- `apps/white_label_app2`: The second white label app, customized for another pizza chain.

Each white label app has its own set of assets, configurations, and branding, while sharing the core functionality provided by the base app.

## Dependency Injection

This project utilizes dependency injection to manage dependencies and facilitate code reuse. By studying the injection of dependencies, you can gain insights into how white label apps can be built and maintained efficiently.

## Screenshots

Here are some screenshots of the Flutter White Label Pizza App:

![Screenshot 1 - Base App](/images/base_app_example.png)
![Screenshot 2 - Braceria App](/images/braceria_app_example.png)
![Screenshot 3 - Brazolio App](/images/brazolio_app_example.png)

![Screenshot 4 - Logos](/images/apps_logos.png)

Feel free to explore the app and see how the different white label apps are customized for each pizza chain.

## Contributing

Contributions to this project are welcome. If you have any suggestions, bug reports, or feature requests, please open an issue or submit a pull request.

Happy coding!
