import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/hex_color.dart';
import 'app_colors.dart';

class ThemeStyles {
  // Global

  static Color get primaryColor => HexColor(AppHexColors.PRIMARY_COLOR);
  static Color get secondaryColor => HexColor(AppHexColors.SECONDARY_COLOR);
  static Color get errorColor => HexColor(AppHexColors.ERROR_COLOR);
  static Color get blackColor => HexColor(AppHexColors.BLACK_COLOR);
  // DARK THEME

  static Color get darkBackground =>
      HexColor(AppHexColors.DARK_THEME_BACKGROUND);
  static Color get darkLayer => HexColor(AppHexColors.DARK_THEME_LAYER);
  static Color get darkLabel => HexColor(AppHexColors.DARK_THEME_LABEL);
  static Color get darkTitleText =>
      HexColor(AppHexColors.DARK_THEME_TITLE_TEXT);
  static Color get darkBodyText => HexColor(AppHexColors.DARK_THEME_BODY_TEXT);

  static Color get lightBackground =>
      HexColor(AppHexColors.LIGHT_THEME_BACKGROUND);
  static Color get lightLayer => HexColor(AppHexColors.LIGHT_THEME_LAYER);
  static Color get lightLabel => HexColor(AppHexColors.LIGHT_THEME_LABEL);
  static Color get lightTitleText =>
      HexColor(AppHexColors.LIGHT_THEME_TITLE_TEXT);
  static Color get lightBodyText =>
      HexColor(AppHexColors.LIGHT_THEME_BODY_TEXT);

  static Color get labelTextColor => HexColor(AppHexColors.LABEL_TEXT_COLOR);
  static Color get textFieldBorderColor =>
      HexColor(AppHexColors.TEXT_FIELD_BORDER_COLOR);

  static ThemeData darkTheme(BuildContext context) => ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBackground,
        colorScheme: _colorSchemeDark,
        shadowColor: darkLabel,
        primaryColor: primaryColor,
        brightness: Brightness.dark,
        focusColor: primaryColor,
        indicatorColor: primaryColor,
        listTileTheme: ListTileThemeData(textColor: darkBodyText),
        tabBarTheme: TabBarTheme(labelColor: darkTitleText),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide:
                BorderSide(color: darkBodyText.withOpacity(0.4), width: 2),
          ),
        ),
        dividerColor: HexColor(AppHexColors.DARK_THEME_LAYER),
        textSelectionTheme: TextSelectionThemeData(cursorColor: primaryColor),
        appBarTheme: AppBarTheme(
            elevation: 0,
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.dark,
                statusBarBrightness: Brightness.dark,
                systemNavigationBarIconBrightness: Brightness.dark),
            titleTextStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: darkTitleText,
                fontWeight: FontWeight.bold,
                fontSize: 18),
            iconTheme: IconThemeData(color: darkTitleText),
            actionsIconTheme: IconThemeData(color: darkTitleText),
            backgroundColor: darkBackground,
            foregroundColor: darkTitleText,
            centerTitle: false),
        primaryTextTheme: Theme.of(context).textTheme.apply(
            bodyColor: darkTitleText,
            displayColor: darkTitleText,
            decorationColor: darkTitleText),
        textTheme: Theme.of(context).textTheme.apply(
            bodyColor: lightTitleText,
            displayColor: lightTitleText,
            decorationColor: lightTitleText),
        cardColor: darkLayer,
        dialogBackgroundColor: darkLayer,
      );

  // LIGHT THEME

  static ThemeData lightTheme(BuildContext context) =>
      ThemeData.light().copyWith(
        scaffoldBackgroundColor: lightBackground,
        primaryColor: primaryColor,
        colorScheme: _colorSchemeLight,
        focusColor: primaryColor,
        indicatorColor: primaryColor,
        listTileTheme: ListTileThemeData(
          textColor: lightTitleText,
        ),
        tabBarTheme: TabBarTheme(
          labelColor: lightTitleText,
        ),
        progressIndicatorTheme: ProgressIndicatorThemeData(
            color: primaryColor,
            linearTrackColor: primaryColor.withOpacity(0.5),
            circularTrackColor: primaryColor.withOpacity(0.5),
            refreshBackgroundColor: primaryColor),
        textSelectionTheme: TextSelectionThemeData(cursorColor: primaryColor),
        shadowColor: lightLabel,
        brightness: Brightness.light,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: lightBodyText.withOpacity(0.4), width: 2),
              borderRadius: BorderRadius.circular(10)),
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        appBarTheme: AppBarTheme(
            elevation: 0,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.light,
              systemNavigationBarIconBrightness: Brightness.light,
            ),
            titleTextStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: lightTitleText,
                fontWeight: FontWeight.bold,
                fontSize: 16),
            iconTheme: IconThemeData(color: lightTitleText),
            actionsIconTheme: IconThemeData(color: lightTitleText),
            backgroundColor: lightBackground,
            foregroundColor: lightTitleText,
            centerTitle: false),
        primaryTextTheme: Theme.of(context).textTheme.apply(
            bodyColor: lightTitleText,
            displayColor: lightTitleText,
            decorationColor: lightTitleText),
        textTheme: Theme.of(context).textTheme.apply(
            bodyColor: lightTitleText,
            displayColor: lightTitleText,
            decorationColor: lightTitleText),
        cardColor: lightLayer,
        dialogBackgroundColor: lightLayer,
      );

  static get _colorSchemeLight => ColorScheme(
      brightness: Brightness.light,
      primary: primaryColor,
      onPrimary: primaryColor,
      secondary: secondaryColor,
      onSecondary: secondaryColor,
      error: errorColor,
      onError: errorColor,
      background: lightBackground,
      onBackground: lightBackground,
      surface: lightLabel,
      onSurface: lightLabel);

  static get _colorSchemeDark => ColorScheme(
      brightness: Brightness.dark,
      primary: primaryColor,
      onPrimary: primaryColor,
      secondary: secondaryColor,
      onSecondary: secondaryColor,
      error: errorColor,
      onError: errorColor,
      background: darkBackground,
      onBackground: darkBackground,
      surface: darkLabel,
      onSurface: darkLabel);
}
