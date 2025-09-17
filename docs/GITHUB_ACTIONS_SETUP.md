# GitHub Actions iOS TestFlight Deployment Setup

This document explains how to set up the GitHub Actions workflow for automatic iOS deployment to TestFlight when code is pushed to the `development` branch.

## Required GitHub Secrets

You need to add the following secrets to your GitHub repository:

### 1. App Store Connect API Credentials

- **`APPSTORE_ISSUER_ID`**: Your App Store Connect Issuer ID
- **`APPSTORE_KEY_ID`**: Your App Store Connect API Key ID  
- **`APPSTORE_PRIVATE_KEY`**: Your App Store Connect API Private Key (base64 encoded)

#### How to get App Store Connect API credentials:

1. Go to [App Store Connect](https://appstoreconnect.apple.com)
2. Navigate to Users and Access → Keys
3. Create a new API key with App Manager role
4. Download the `.p8` file and note the Key ID and Issuer ID
5. Convert the `.p8` file to base64: `base64 -i AuthKey_XXXXXXXXXX.p8 | pbcopy`

### 2. Code Signing Certificates

- **`IOS_DISTRIBUTION_CERTIFICATE_P12`**: Your iOS Distribution certificate in P12 format (base64 encoded)
- **`IOS_DISTRIBUTION_CERTIFICATE_PASSWORD`**: Password for the P12 certificate

#### How to get code signing certificates:

1. Export your iOS Distribution certificate from Keychain Access
2. Choose "Personal Information Exchange (.p12)" format
3. Set a password for the certificate
4. Convert to base64: `base64 -i certificate.p12 | pbcopy`

## Workflow Features

The GitHub Actions workflow includes:

- ✅ **Automatic trigger** on push to `development` branch
- ✅ **Flutter setup** with dependency caching
- ✅ **iOS build** with proper code signing
- ✅ **TestFlight upload** with automatic provisioning
- ✅ **Test execution** before deployment
- ✅ **Build notifications** for success/failure

## Workflow Steps

1. **Checkout Code**: Gets the latest code from the repository
2. **Setup Flutter**: Installs Flutter SDK with caching
3. **Install Dependencies**: Runs `flutter pub get`
4. **Run Tests**: Executes `flutter test` to ensure code quality
5. **Setup Xcode**: Configures the required Xcode version
6. **Install CocoaPods**: Sets up iOS dependencies
7. **Import Certificates**: Imports code signing certificates
8. **Install Provisioning Profile**: Downloads the required provisioning profile
9. **Build Flutter iOS**: Creates the iOS build
10. **Archive App**: Creates an Xcode archive
11. **Export IPA**: Exports the signed IPA file
12. **Upload to TestFlight**: Uploads the build to App Store Connect

## Prerequisites

Before using this workflow, ensure you have:

1. **Apple Developer Account** with App Store Connect access
2. **iOS Distribution Certificate** in your Apple Developer account
3. **App Store Provisioning Profile** for bundle ID `ios.woow.social.app`
4. **App registered** in App Store Connect with the correct bundle ID
5. **TestFlight access** enabled for your app

## Manual Trigger

The workflow can also be triggered manually:

1. Go to your GitHub repository
2. Click on "Actions" tab
3. Select "iOS TestFlight Deployment"
4. Click "Run workflow"
5. Choose the branch and click "Run workflow"

## Troubleshooting

### Common Issues:

1. **Code signing errors**: Verify your certificates and provisioning profiles are valid
2. **Bundle ID mismatch**: Ensure the bundle ID matches in all configurations
3. **API key issues**: Check that your App Store Connect API credentials are correct
4. **Build failures**: Review the Flutter and iOS build logs for specific errors

### Debug Steps:

1. Check the GitHub Actions logs for detailed error messages
2. Verify all secrets are properly set in GitHub repository settings
3. Ensure your Apple Developer account has the necessary permissions
4. Test the build locally using the same commands as in the workflow

## Security Notes

- All sensitive information is stored as GitHub secrets
- Certificates and keys are never exposed in logs
- The workflow uses official Apple and Flutter actions for security
- Base64 encoding is used for binary files (certificates, keys)

## Support

If you encounter issues:

1. Check the GitHub Actions logs for specific error messages
2. Verify your Apple Developer account setup
3. Ensure all required secrets are properly configured
4. Test the build process locally first
