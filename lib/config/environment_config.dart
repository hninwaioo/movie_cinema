class EnvironmentConfig {
  static const String CONFIG_THEME_COLOR = String.fromEnvironment("CONFIG_THEME_COLOR",defaultValue: "COLOR_MOVIE_BOOKING");

  static const String CONFIG_APP_TITLE = String.fromEnvironment("CONFIG_APP_TITLE",defaultValue: "APP_TITLE_MOVIE_BOOKING");

}

/// FLAVORS

/// MOVIE BOOKING
/// flutter run --dart-define=CONFIG_THEME_COLOR=COLOR_MOVIE_BOOKING --dart-define=CONFIG_APP_TITLE=APP_TITLE_MOVIE_BOOKING

/// MOVIE APP
/// flutter run --dart-define=CONFIG_THEME_COLOR=COLOR_MOVIE_APP --dart-define=CONFIG_APP_TITLE=APP_TITLE_MOVIE_APP