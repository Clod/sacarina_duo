# sacarina_duo - Pediatric Cardiac Risk Calculator

This Flutter application is designed to calculate cardiac risk in pediatric patients based on a series of input parameters.

## Project Overview

This project is a Flutter application, built to be cross-platform compatible, targeting Android, iOS, Web, Windows, macOS, and Linux. The application's core functionality revolves around calculating pediatric cardiac risk, likely using specific algorithms and parameters relevant to pediatric cardiology.

### Key Features

- **Cardiac Risk Calculation:** The primary function of the app is to compute cardiac risk for pediatric patients. This likely involves inputting patient-specific parameters and processing them through a risk assessment model.
- **Cross-Platform Compatibility:** Built with Flutter, the application is designed to run on multiple platforms including Android, iOS, Web, Windows, macOS, and Linux, ensuring broad accessibility.
- **Visual Representation:** The inclusion of custom gauge widgets (`linear_gauge.dart`, `pretty_gauge.dart`) suggests that the application provides visual representations of the calculated risk, possibly through intuitive graphical interfaces.
- **Localization:** The presence of localization files (`lib/l10n/app_en.arb`, `lib/l10n/app_es.arb`) indicates that the application supports at least English and Spanish languages, enhancing its usability for a wider audience.
- **Help and Guidance:** The inclusion of help-related files (`lib/help_drawer.dart`, `lib/help_pages/`) suggests that the application provides user assistance and information, likely to guide users on how to use the app and understand the results.

### Project Structure

The project follows a standard Flutter application structure:

- **`android/`, `ios/`, `web/`, `windows/`, `macos/`, `linux/`**:  These directories contain platform-specific configurations and build settings for each supported operating system.
- **`lib/`**: This directory houses the Dart source code for the application:
    - **`main.dart`**: The main entry point of the Flutter application.
    - **`model.dart`**: Likely defines the data models used within the application, especially for patient parameters and risk calculations.
    - **`linear_gauge.dart`, `pretty_gauge.dart`**: Custom Flutter widgets for displaying gauge-style visual elements, probably used to represent risk levels.
    - **`help_drawer.dart`, `lib/help_pages/`**: Files related to the application's help and documentation features.
    - **`l10n/`**: Contains localization files for different languages.
    - **Other Dart files**:  Files like `help_drawer.dart`, `radio_picker_dialog_local.dart`, `responsive_dialog_composed_header.dart`, `responsive_dialog_local.dart`, `show_radio_picker_local.dart`, `theme.dart` and `help_pages/item_help.dart` suggest the presence of UI components, dialogs, theming and navigation elements.
- **`assets/`**: Contains application assets such as icons, splash screens, and potentially other media.
- **`test/`**: Includes widget tests for ensuring the quality and functionality of the application's UI components.
- **`pubspec.yaml`**: The project's pubspec file, which manages dependencies, assets, and other project metadata.

### Potential Areas for Further Exploration

- **Risk Calculation Algorithm:** Investigating the `lib/model.dart` and potentially `main.dart` files to understand the specific algorithms and parameters used for cardiac risk calculation would be beneficial.
- **UI/UX Design:** Examining the layout and user interface elements in the Dart files to assess the user experience and identify potential improvements.
- **Gauge Widget Implementation:**  Delving into `linear_gauge.dart` and `pretty_gauge.dart` to understand how the risk is visually presented and if these widgets are customizable or configurable.
- **Localization Completeness:** Checking the `l10n` directory to see the extent of language support and if all text elements are properly localized.
- **Testing and Quality Assurance:** Reviewing the `test/widget_test.dart` to understand the testing strategy and coverage of the application.

### Getting Started with Development

This project is a standard Flutter application. To get started with development:

1. **Install Flutter:** Ensure you have Flutter SDK installed on your development machine. Follow the official Flutter installation guide for your operating system.
2. **Clone the Repository:** Clone this repository to your local machine.
3. **Get Dependencies:** Navigate to the project directory in your terminal and run `flutter pub get` to fetch all the required dependencies.
4. **Run the Application:**
    - To run on Android: Connect an Android device or start an Android emulator and run `flutter run android`.
    - To run on iOS: Connect an iOS device or start an iOS simulator and run `flutter run ios`.
    - To run on Web: Run `flutter run web`.
    - For other platforms, use the corresponding `flutter run` command (e.g., `flutter run windows`, `flutter run macos`, `flutter run linux`).

For further assistance with Flutter development, refer to the official [Flutter documentation](https://flutter.dev/docs).

This analysis provides a comprehensive overview of the sacarina_duo Flutter project, outlining its purpose, structure, and key features. It serves as a starting point for understanding the project and guiding further development or contributions.




