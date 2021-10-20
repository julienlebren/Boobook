import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout_builder/layout_builder.dart';

final boobookThemeProvider = Provider<AppTheme>((ref) {
  final brightness = ref.watch(brightnessProvider);

  Color scaffoldBackgroundColor;
  Color formBackgroundColor;
  Color listTileBackground;
  Color navigationBarBorderColor;
  Color cupertinoBarBackgroundColor;
  Color textColor;
  Color selectedColor;
  Color dividerColor;
  Color shadowColor;

  switch (brightness) {
    case Brightness.dark:
      scaffoldBackgroundColor = Color(0xFF121212);
      formBackgroundColor = Color(0xFF121212);
      listTileBackground = Color(0xFF262626);
      navigationBarBorderColor = Color(0xFF333333);
      textColor = Colors.white;
      selectedColor = Colors.grey.shade800;
      cupertinoBarBackgroundColor = Color.fromRGBO(0, 0, 0, 0.7);
      dividerColor = Color(0xFF333333);
      shadowColor = Color(0xFF666666);
      break;
    case Brightness.light:
      scaffoldBackgroundColor = Color(0xFFF0F0F0);
      formBackgroundColor = Colors.white;
      navigationBarBorderColor = Color(0xFFE0E0E0);
      listTileBackground = Colors.white;
      textColor = Colors.black;
      selectedColor = Colors.grey.shade200;
      cupertinoBarBackgroundColor = Color.fromRGBO(255, 255, 255, 0.5);
      dividerColor = Color(0xFFE6E6E6);
      shadowColor = Color(0xFF999999);
      break;
  }

  return AppTheme(
    brightness: brightness,
    primaryColor: Color(0xFF6da548), //Color(0xFF43A047),
    secondaryColor: Color(0xFFF4C946),
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    materialSystemBarColor: Color(0xFFEEEEEE),
    navigationBarBackgroundColor: Color(0xFF6da548),
    navigationBarBorderColor: navigationBarBorderColor,
    elevatedButtonPadding: 12,
    elevatedButtonRadius: 10,
    formBackgroundColor: formBackgroundColor,
    listTileBackground: listTileBackground,
    cupertinoBarBackgroundColor: cupertinoBarBackgroundColor,
    textColor: textColor,
    selectedColor: selectedColor,
    borderColor: Color(0xFFBDBDBD),
    dividerColor: dividerColor,
    shadowColor: shadowColor,
  );
});