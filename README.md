# Torliga App

**Torliga App** is a Flutter application that displays live sports matches, including teams, scores, and match details, with real-time updates. The app is built using BLoC for state management, follows a clean architecture.

## Project Structure
```bash
lib/
│
├── core/                  # Core utilities and base classes
├── feature/
│   ├── home/
│   │   ├── data/
│   │   │   ├── repository/        # API integration and data layer
│   │   │   └── models/            # Data models (e.g., Match, Team, Competition)
│   │   ├── logic/                 # Business logic and state management (BLoC)
│   │   └── ui/                    # UI components for Home and Match screens
└── main.dart              # Entry point of the application
```

## Features

- **Match Listings**: View a list of scheduled and live matches, including details like teams, match time, and venue.
- **Real-time Score Updates**: Receive instant score changes for live matches.

## Installation

1. Ensure Flutter is installed on your system. If not, follow the setup instructions on the official [Flutter website](https://flutter.dev/docs/get-started/install).

2. Clone this repository using the command:
    ```bash
    git clone https://gitlab.com/ossamaa.xider/torliga
    ```

3. Navigate to the project directory:
    ```bash
    cd torliga
    ```

4. Install the required dependencies:
    ```bash
    flutter pub get
    ```

5. generate the necessary auto-generated files;
    ```bash
    flutter run build_runner build --delete-conflicting-outputs
    ```

6. Run the application:
    ```bash
    flutter run
    ```


## Getting Support

If you encounter issues, feel free to open an issue in the GitLab repository or reach out directly through the repository’s contact information.
