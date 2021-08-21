part of config;

class AppTheme {
  factory AppTheme() {
    return _instance;
  }

  AppTheme._internal();
  static final AppTheme _instance = AppTheme._internal();
  static const Color primary = Color(0xFF1DBAB6);
  static const Color primaryVariant = Color(0xFF99F6E4);
  static const Color background = Colors.white;
  static const Color placehoder = Color(0xFFE0E0E0);
  static const Color blueColor = Color(0xff408BF9);
  static const Color labelColor = Color(0xff000000);
  static const Color subtitleColor = Color(0xff989898);

  static ThemeData getCollectionTheme() {
    const colorScheme = ColorScheme.light(
      primary: primary,
      primaryVariant: primaryVariant,
      secondary: Color(0xffff8a65),
      secondaryVariant: Color(0xffc75b39),
      surface: Color(0xfff2f2f2),
      background: background,
      error: Colors.red,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.black,
      onBackground: Colors.black,
      onError: Colors.white,
      brightness: Brightness.light,
    );

    final dark = colorScheme.brightness == Brightness.dark;
    final primaryColor = dark ? colorScheme.surface : colorScheme.primary;
    final appBarColor = dark ? colorScheme.surface : colorScheme.background;
    final indicatorColor = dark ? colorScheme.onSurface : colorScheme.primary;
    return ThemeData(
      brightness: colorScheme.brightness,
      primaryColor: colorScheme.primary,
      primaryColorBrightness: ThemeData.estimateBrightnessForColor(
        primaryColor,
      ),
      appBarTheme: AppBarTheme(color: appBarColor),
      canvasColor: colorScheme.background,
      accentColor: colorScheme.secondary,
      accentColorBrightness: ThemeData.estimateBrightnessForColor(
        colorScheme.secondary,
      ),
      scaffoldBackgroundColor: colorScheme.background,
      bottomAppBarColor: colorScheme.surface,
      cardColor: colorScheme.surface,
      dividerColor: colorScheme.onSurface.withOpacity(0.12),
      backgroundColor: colorScheme.background,
      dialogBackgroundColor: colorScheme.surface,
      errorColor: colorScheme.error,
      indicatorColor: indicatorColor,
      applyElevationOverlayColor: dark,
      colorScheme: colorScheme,
      buttonColor: colorScheme.primary,
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colorScheme.surface,
        shape: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
      ),
    );
  }
}
