# Background Remover App

A beautiful, multiplatform application that removes backgrounds from images and saves them as PNG files with transparency.

## ✨ Features

- 🖼️ **Background Removal**: Intelligent algorithm to remove backgrounds from images
- 💾 **PNG Export**: Save processed images with transparent backgrounds
- 📱 **Multiplatform**: Runs on Windows, Linux, macOS, Android, and iOS
- 🎨 **Modern UI**: Clean, intuitive Material Design interface
- 📸 **Camera Support**: Capture photos directly or choose from gallery
- 🌓 **Dark/Light Theme**: Automatic theme switching based on system preferences

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (>=3.0.0)
- For Android: Android Studio and Android SDK
- For iOS: Xcode and CocoaPods
- For Windows: Visual Studio with C++ development tools
- For Linux: GTK development libraries
- For macOS: Xcode

### Installation

1. Clone the repository:
```bash
git clone https://github.com/edgarmirandasilva/Remove-back-png.git
cd Remove-back-png
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
# For mobile (Android/iOS)
flutter run

# For desktop
flutter run -d windows  # Windows
flutter run -d macos    # macOS
flutter run -d linux    # Linux
```

## 📱 Platform-Specific Setup

### Android

The app requires the following permissions (already configured):
- Camera access
- Photo library access
- Storage access

Minimum SDK version: 21 (Android 5.0)

### iOS

Ensure you have the following in your `Info.plist` (already configured):
- `NSCameraUsageDescription`
- `NSPhotoLibraryUsageDescription`
- `NSPhotoLibraryAddUsageDescription`

### Windows

Build the app using:
```bash
flutter build windows
```

The executable will be located in `build/windows/runner/Release/`

### Linux

Install required dependencies:
```bash
sudo apt-get install clang cmake ninja-build pkg-config libgtk-3-dev
```

Build the app:
```bash
flutter build linux
```

### macOS

Build the app:
```bash
flutter build macos
```

## 🎯 Usage

1. **Select Image**: 
   - Tap "Gallery" to choose an existing image
   - Tap "Camera" to take a new photo

2. **Remove Background**: 
   - Tap "Remove Background" to process the image
   - Wait for the processing to complete

3. **Save Image**: 
   - Tap "Save as PNG" to export the processed image
   - The image will be saved with a transparent background

4. **Reset**: 
   - Tap "Reset" to start over with a new image

## 🔧 How It Works

The app uses an intelligent edge detection and color thresholding algorithm:

1. **Corner Sampling**: Samples corner pixels to determine background color
2. **Color Distance**: Calculates color distance for each pixel from the background
3. **Threshold Application**: Pixels similar to background become transparent
4. **Edge Refinement**: Applies smoothing for cleaner edges
5. **PNG Encoding**: Exports the result as PNG with alpha channel

## 📦 Dependencies

- `image_picker` - For selecting and capturing images
- `image` - For image processing and manipulation
- `path_provider` - For accessing device storage
- `permission_handler` - For managing platform permissions

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is open source and available under the MIT License.

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Image processing algorithms based on computer vision techniques
- Material Design for UI/UX guidelines

## 📧 Contact

For questions or support, please open an issue on GitHub.
