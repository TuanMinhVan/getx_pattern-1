part of config;

extension ContextEx on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  Color get primary => colorScheme.primary;
  Color get primaryVariant => colorScheme.primaryVariant;
  Color get secondary => colorScheme.secondary;
  Color get secondaryVariant => colorScheme.secondaryVariant;
  Color get surface => colorScheme.surface;
  Color get background => colorScheme.background;
  Color get error => colorScheme.error;
  Color get onPrimary => colorScheme.onPrimary;
  Color get onSecondary => colorScheme.onSecondary;
  Color get onSurface => colorScheme.onSurface;
  Color get onBackground => colorScheme.onBackground;
  Color get onError => colorScheme.onError;

  TextTheme get textTheme => Theme.of(this).textTheme;
  TextStyle get overline => Theme.of(this).textTheme.overline!;
  TextStyle get caption => Theme.of(this).textTheme.caption!;
  TextStyle get button => Theme.of(this).textTheme.button!;
  TextStyle get bodyText2 => Theme.of(this).textTheme.bodyText2!;
  TextStyle get bodyText1 => Theme.of(this).textTheme.bodyText1!;
  TextStyle get subtitle2 => Theme.of(this).textTheme.subtitle2!;
  TextStyle get subtitle1 => Theme.of(this).textTheme.subtitle1!;
  TextStyle get headline1 => Theme.of(this).textTheme.headline1!;
  TextStyle get headline2 => Theme.of(this).textTheme.headline2!;
  TextStyle get headline3 => Theme.of(this).textTheme.headline3!;
  TextStyle get headline4 => Theme.of(this).textTheme.headline4!;
  TextStyle get headline5 => Theme.of(this).textTheme.headline5!;
  TextStyle get headline6 => Theme.of(this).textTheme.headline6!;

  Size get size => MediaQuery.of(this).size;

  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  double get scale => MediaQuery.of(this).devicePixelRatio;

  Orientation get orientation => MediaQuery.of(this).orientation;

  Color get dividerColor => Theme.of(this).dividerColor;

  Color get canvasColor => Theme.of(this).canvasColor;

  EdgeInsets get padding => MediaQuery.of(this).padding;

  double get widthScale =>
      MediaQuery.of(this).size.width > MediaQuery.of(this).size.height
          ? MediaQuery.of(this).size.height
          : MediaQuery.of(this).size.width;

  double get heightScale =>
      MediaQuery.of(this).size.width < MediaQuery.of(this).size.height
          ? MediaQuery.of(this).size.height
          : MediaQuery.of(this).size.width;

  int get widthPixels => (width * height).toInt();
  int get heightPixels => (height * scale).toInt();
  double get textScaleFactor => MediaQuery.of(this).textScaleFactor;
}
