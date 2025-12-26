import 'dart:io';
import 'dart:typed_data';
import 'package:image/image.dart' as img;

class BackgroundRemover {
  /// Remove background from an image using edge detection and color thresholding
  /// This is a simple algorithm that works well for images with solid or uniform backgrounds
  static Future<Uint8List> removeBackground(File imageFile) async {
    // Read the image file
    final bytes = await imageFile.readAsBytes();
    
    // Check file size to prevent memory issues
    // Limit to approximately 10MB to ensure smooth processing
    if (bytes.length > 10 * 1024 * 1024) {
      throw Exception('Image too large. Please use an image smaller than 10MB.');
    }
    
    final image = img.decodeImage(bytes);

    if (image == null) {
      throw Exception('Failed to decode image');
    }

    // Create a new image with alpha channel
    final output = img.Image(
      width: image.width,
      height: image.height,
      numChannels: 4,
    );

    // Sample corner pixels to determine background color
    final cornerColors = [
      image.getPixel(0, 0),
      image.getPixel(image.width - 1, 0),
      image.getPixel(0, image.height - 1),
      image.getPixel(image.width - 1, image.height - 1),
    ];

    // Calculate average background color from corners
    int avgRed = 0, avgGreen = 0, avgBlue = 0;
    for (var color in cornerColors) {
      avgRed += color.r.toInt();
      avgGreen += color.g.toInt();
      avgBlue += color.b.toInt();
    }
    avgRed ~/= cornerColors.length;
    avgGreen ~/= cornerColors.length;
    avgBlue ~/= cornerColors.length;

    // Threshold for color similarity (adjust for better results)
    // Value of 40 works well for most images with uniform backgrounds
    // Lower values = more aggressive removal (may remove foreground)
    // Higher values = less aggressive removal (may leave background)
    const double threshold = 40.0;

    // Process each pixel
    for (int y = 0; y < image.height; y++) {
      for (int x = 0; x < image.width; x++) {
        final pixel = image.getPixel(x, y);
        final r = pixel.r.toInt();
        final g = pixel.g.toInt();
        final b = pixel.b.toInt();

        // Calculate color distance from background
        final distance = ((r - avgRed) * (r - avgRed) +
                (g - avgGreen) * (g - avgGreen) +
                (b - avgBlue) * (b - avgBlue))
            .toDouble();

        // If pixel is similar to background color, make it transparent
        if (distance < threshold * threshold) {
          // Make transparent
          output.setPixel(x, y, img.ColorRgba8(r, g, b, 0));
        } else {
          // Keep original color with full opacity
          output.setPixel(x, y, img.ColorRgba8(r, g, b, 255));
        }
      }
    }

    // Apply edge refinement for smoother edges
    final refined = _refineEdges(output);

    // Encode as PNG with transparency
    final pngBytes = img.encodePng(refined);
    return Uint8List.fromList(pngBytes);
  }

  /// Refine edges using a simple blur and threshold technique
  static img.Image _refineEdges(img.Image image) {
    final refined = img.Image(
      width: image.width,
      height: image.height,
      numChannels: 4,
    );

    for (int y = 0; y < image.height; y++) {
      for (int x = 0; x < image.width; x++) {
        final pixel = image.getPixel(x, y);
        int alphaSum = pixel.a.toInt();
        int count = 1;

        // Check neighboring pixels
        for (int dy = -1; dy <= 1; dy++) {
          for (int dx = -1; dx <= 1; dx++) {
            if (dx == 0 && dy == 0) continue;

            final nx = x + dx;
            final ny = y + dy;

            if (nx >= 0 && nx < image.width && ny >= 0 && ny < image.height) {
              final neighbor = image.getPixel(nx, ny);
              alphaSum += neighbor.a.toInt();
              count++;
            }
          }
        }

        final avgAlpha = alphaSum ~/ count;
        final newPixel = img.ColorRgba8(
          pixel.r.toInt(),
          pixel.g.toInt(),
          pixel.b.toInt(),
          avgAlpha,
        );
        refined.setPixel(x, y, newPixel);
      }
    }

    return refined;
  }
}
