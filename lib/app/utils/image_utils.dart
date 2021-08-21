class ImageUtils {
  factory ImageUtils() {
    return _instance;
  }

  ImageUtils._internal();
  static final ImageUtils _instance = ImageUtils._internal();
}
  