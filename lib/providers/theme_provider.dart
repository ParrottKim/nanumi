import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: 'Pretendard',
  brightness: Brightness.light,
  scaffoldBackgroundColor: Color(0xFFF4F6F5),
  primaryColor: Colors.white,
  cardColor: Colors.white,
  shadowColor: Colors.grey.withOpacity(0.75),
  splashColor: Colors.transparent,
  highlightColor: Colors.black.withOpacity(0.1),
  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.light,
    backgroundColor: Colors.white,
  ).copyWith(
    primary: Color(0xFF669F85),
    secondary: Color(0xFFE5E7E8),
    outline: Color(0xFF3B4E52),
  ),
  textTheme: TextTheme(
    subtitle1: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
      color: Colors.grey[700],
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFFF4F6F5),
    foregroundColor: Color(0xFF3B4E52),
    shadowColor: Colors.grey.withOpacity(0.75),
    iconTheme: IconThemeData(
      color: Color(0xFF3B4E52),
    ),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.teal,
    textTheme: ButtonTextTheme.primary,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      minimumSize: Size.zero,
      padding: EdgeInsets.zero,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Color(0xFFD9F6E9)),
    ),
  ),
  iconTheme: IconThemeData(
    color: Color(0xFF3B4E52),
  ),
  // inputDecorationTheme: InputDecorationTheme(
  //   alignLabelWithHint: true,
  //   labelStyle: const TextStyle(
  //     fontSize: 14.0,
  //     fontWeight: FontWeight.w500,
  //   ),
  //   floatingLabelBehavior: FloatingLabelBehavior.never,
  //   fillColor: Colors.white,
  //   filled: false,
  //   contentPadding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
  //   errorStyle: const TextStyle(
  //     fontSize: 14.0,
  //     fontWeight: FontWeight.w500,
  //     color: Colors.red,
  //   ),
  //   border: OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(8.0),
  //   ),
  //   enabledBorder: OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(8.0),
  //     borderSide: const BorderSide(
  //       color: Color(0xFF3B4E52),
  //       width: 2.0,
  //     ),
  //   ),
  //   focusedBorder: OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(8.0),
  //     borderSide: const BorderSide(
  //       color: Color(0xFF3B4E52),
  //       width: 2.0,
  //     ),
  //   ),
  //   disabledBorder: OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(8.0),
  //     borderSide: const BorderSide(
  //       color: Color(0xFF3B4E52),
  //       width: 2.0,
  //     ),
  //   ),
  // ),
);

ThemeData darkTheme = ThemeData(
  fontFamily: 'Pretendard',
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Color(0xFF1D211F),
  primaryColor: Colors.black,
  cardColor: Colors.grey[800],
  shadowColor: Colors.black.withOpacity(0.75),
  splashColor: Colors.transparent,
  highlightColor: Colors.black.withOpacity(0.1),
  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.dark,
    backgroundColor: Colors.white,
  ).copyWith(
    primary: Color(0xFF669F85),
    secondary: Color(0xFFE5E7E8),
    outline: Color(0xFFE5E7E8),
  ),
  textTheme: TextTheme(
    subtitle1: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
      color: Colors.grey[400],
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF1D211F),
    foregroundColor: Color(0xFFE5E7E8),
    shadowColor: Colors.black.withOpacity(0.75),
    iconTheme: IconThemeData(
      color: Color(0xFFE5E7E8),
    ),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.teal,
    textTheme: ButtonTextTheme.primary,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.teal),
    ),
  ),
  iconTheme: IconThemeData(
    color: Color(0xFFE5E7E8),
  ),
);

final AutoDisposeChangeNotifierProvider<ThemeProvider> themeProvider =
    ChangeNotifierProvider.autoDispose((ref) => ThemeProvider());

class ThemeProvider extends ChangeNotifier {
  ThemeProvider() {
    final String mode = Hive.box('prefs')
        .get('themeMode', defaultValue: ThemeMode.system.toString()) as String;
    switch (mode) {
      case 'ThemeMode.dark':
        themeMode = ThemeMode.dark;
        break;
      case 'ThemeMode.light':
        themeMode = ThemeMode.light;
        break;
      case 'ThemeMode.system':
        themeMode = ThemeMode.system;
        break;
    }
  }

  ThemeMode? themeMode;

  void setThemeMode(ThemeMode mode) {
    themeMode = mode;
    Hive.box('prefs').put('themeMode', themeMode.toString());
    notifyListeners();
  }
}
