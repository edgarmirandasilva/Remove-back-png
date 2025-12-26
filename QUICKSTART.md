# Quick Start Guide

## Running on Different Platforms

### Android
```bash
# Connect your Android device or start an emulator
flutter devices

# Run the app
flutter run
```

### iOS (macOS only)
```bash
# Open iOS Simulator or connect an iOS device
open -a Simulator

# Run the app
flutter run
```

### Windows
```bash
# Run in debug mode
flutter run -d windows

# Or build a release version
flutter build windows
cd build\windows\runner\Release\
remove_background_app.exe
```

### Linux
```bash
# Install dependencies first (Ubuntu/Debian)
sudo apt-get update
sudo apt-get install clang cmake ninja-build pkg-config libgtk-3-dev liblzma-dev

# Run the app
flutter run -d linux
```

### macOS
```bash
# Run the app
flutter run -d macos
```

## Troubleshooting

### Permission Issues (Mobile)
If you encounter permission issues:
1. Go to device Settings
2. Find the app "Background Remover"
3. Enable Camera and Storage permissions

### Build Issues
If you encounter build issues:
```bash
# Clean the build
flutter clean

# Get dependencies again
flutter pub get

# Try building again
flutter run
```

### Plugin Issues
If plugins are not working:
```bash
flutter pub upgrade
flutter pub get
```

## Performance Tips

1. **Image Size**: Smaller images process faster
2. **Background**: Works best with solid or uniform backgrounds
3. **Lighting**: Well-lit images produce better results
4. **Contrast**: Higher contrast between subject and background improves accuracy
