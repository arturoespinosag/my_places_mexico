import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myplaces_mexico/core/core.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get light => ThemeData(
        useMaterial3: true,
        appBarTheme: _appBarTheme,
        scaffoldBackgroundColor: Colors.white,
        iconTheme: _iconTheme,
        listTileTheme: _listTileTheme,
        // fontFamily: FontFamily.myriadPro,
        platform: TargetPlatform.iOS, // scroll physics
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Palette.mainBlue,
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Colors.black,
        ),
        elevatedButtonTheme: _elevatedButtonTheme,
        outlinedButtonTheme: _outlinedButtonTheme,
        textButtonTheme: _textButtonTheme,
        inputDecorationTheme: _inputDecorationTheme,
        checkboxTheme: _checkboxTheme,
        // textTheme: _textTheme,
        bottomNavigationBarTheme: _bottomNavigationBarTheme,
        // colorScheme: ColorScheme(
        //   background: Colors.grey,
        //   brightness: Brightness.light,

        // ),
      );

  /// [TextTheme] for the [light] theme, it uses 2021 set.
  // static TextTheme get _textTheme => TextTheme(
  //       displayLarge: displayLarge,
  //       displayMedium: displayMedium,
  //       displaySmall: displaySmall,
  //       headlineLarge: headlineLarge,
  //       headlineMedium: headlineMedium,
  //       headlineSmall: headlineSmall,
  //       titleLarge: titleLarge,
  //       titleMedium: titleMedium,
  //       titleSmall: titleSmall,
  //       bodyLarge: bodyLarge,
  //       bodyMedium: bodyMedium,
  //       bodySmall: bodySmall,
  //       labelLarge: labelLarge,
  //       labelMedium: labelMedium,
  //       labelSmall: labelSmall,
  //     );

  static AppBarTheme get _appBarTheme => const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
        ),
        elevation: 0,
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      );

  static ListTileThemeData get _listTileTheme => const ListTileThemeData(
        iconColor: Colors.black,
        textColor: Colors.black,
        minLeadingWidth: 20,
      );

  static ElevatedButtonThemeData get _elevatedButtonTheme =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: borderRadius16,
          ),
          backgroundColor: Colors.black,
          textStyle: const TextStyle(
            fontSize: 16,
            color: Colors.green,
            fontWeight: FontWeight.w600,
          ),
          padding: edgeInsetsSymmetricV20,
          elevation: 0,
        ),
      );

  static OutlinedButtonThemeData get _outlinedButtonTheme =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.black,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          elevation: 0,
        ),
      );

  static TextButtonThemeData get _textButtonTheme => TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.grey,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
      );

  static InputDecorationTheme get _inputDecorationTheme =>
      const InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: borderRadius5),
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      );

  static CheckboxThemeData get _checkboxTheme => CheckboxThemeData(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        side: BorderSide(color: Colors.grey.shade300, width: 2),
        visualDensity: VisualDensity.compact,
      );

  static BottomNavigationBarThemeData get _bottomNavigationBarTheme =>
      const BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
        selectedIconTheme: IconThemeData(color: Colors.green),
        selectedItemColor: Colors.green,
        selectedLabelStyle: TextStyle(color: Colors.green),
        unselectedIconTheme: IconThemeData(color: Colors.white),
        unselectedItemColor: Colors.white,
        unselectedLabelStyle: TextStyle(color: Colors.white),
      );

  static IconThemeData get _iconTheme => const IconThemeData(
        color: Colors.black,
      );
}
