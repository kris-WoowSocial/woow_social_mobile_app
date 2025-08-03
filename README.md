# Woow Social Mobile App

A social media application built with Flutter.

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (latest stable version)
- Dart SDK (latest stable version)
- Android Studio / Xcode (for emulator/simulator)
- Git

### Environment Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/kris-WoowSocial/woow_social_mobile_app.git
   cd woow_social_mobile_app
   ```

2. **Setup Environment Variables**
   - Copy the `.env.template` file to `.env`:
     ```bash
     cp .env.template .env
     ```
   - Fill in the required API keys and secrets in the `.env` file
   - **IMPORTANT**: Never commit the `.env` file to version control

3. **Install Dependencies**
   ```bash
   flutter pub get
   ```

4. **Run the App**
   ```bash
   flutter run
   ```

## 🔒 Security Best Practices

### API Keys and Secrets
- All sensitive information must be stored in the `.env` file
- The `.env` file is included in `.gitignore` and should never be committed
- Use the `Environment` class to access environment variables

### Google Services Configuration
- `google-services.json` is used for Firebase configuration
- This file contains sensitive information and should not be committed to version control
- The file is already in `.gitignore`

### Secure Storage
- Use `SharedPreferences` only for non-sensitive data
- For sensitive data, consider using `flutter_secure_storage`

## 🛠️ Development

### Code Style
- Follow the official [Flutter Style Guide](https://github.com/flutter/flutter/wiki/Style-guide-for-Flutter-repo)
- Run `flutter format .` to format your code
- Use meaningful commit messages following [Conventional Commits](https://www.conventionalcommits.org/)

### Dependencies
- Manage dependencies in `pubspec.yaml`
- Run `flutter pub upgrade` to update dependencies
- Document any major dependency changes in pull requests

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
