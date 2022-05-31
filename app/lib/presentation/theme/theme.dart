import 'package:boobook/common_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout_builder/layout_builder.dart';
import 'package:sign_in/sign_in.dart';

final brightnessProvider = Provider<Brightness>((ref) {
  return ref.watch(userProvider.select((user) {
    if (user != null) {
      return user.theme.brightness;
    } else {
      return WidgetsBinding.instance.window.platformBrightness;
    }
  }));
});

final boobookTheme = Provider<AppTheme>((ref) {
  final brightness = ref.watch(brightnessProvider);

  Color scaffoldBackgroundColor;
  Color groupedListBackgroundColor;
  Color listTileBackground;
  Color navigationBarBorderColor;
  Color textColor;
  Color selectedColor;
  Color dividerColor;
  Color shadowColor;

  switch (brightness) {
    case Brightness.dark:
      scaffoldBackgroundColor = Color(0xFF000000);
      groupedListBackgroundColor = Color(0xFF000000);
      listTileBackground = Color(0xFF000000);
      navigationBarBorderColor = Color(0xFF333333);
      textColor = Colors.white;
      selectedColor = Colors.grey.shade800;
      dividerColor = Color(0xFF333333);
      shadowColor = Color(0xFF666666);
      break;
    case Brightness.light:
      scaffoldBackgroundColor = Color(0xFFF5F5F5);
      groupedListBackgroundColor = Color(0xFFF2F2F2);
      navigationBarBorderColor = Color(0xFFE0E0E0);
      listTileBackground = Colors.white;
      textColor = Colors.black;
      selectedColor = Colors.grey.shade200;
      dividerColor = Color(0xFFE6E6E6);
      shadowColor = Color(0xFF999999);
      break;
  }

  return AppTheme(
    brightness: brightness,
    primaryColor: Color(0xFF6DA548), //Color(0xFF43A047),
    secondaryColor: Color(0xFFF4C946),
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    groupedListBackgroundColor: groupedListBackgroundColor,
    materialSystemBarColor: Color(0xFFEEEEEE),
    navigationBarBackgroundColor: Color(0xFF6da548),
    navigationBarBorderColor: navigationBarBorderColor,
    elevatedButtonPadding: 12,
    elevatedButtonRadius: 10,
    listTileBackground: listTileBackground,
    textColor: textColor,
    selectedColor: selectedColor,
    borderColor: Color(0xFFBDBDBD),
    dividerColor: dividerColor,
    shadowColor: shadowColor,
  );
});

final boobookSignInTheme = Provider<SignInTheme>((ref) {
  final appTheme = ref.watch(boobookTheme);
  final rowBackgroundColor = ref.watch(formThemeProvider.select(
    (theme) => theme.rowBackgroundColor,
  ));

  return SignInTheme(
    backgroundImage: "assets/images/background2.png",
    primaryColor: appTheme.primaryColor,
    scaffoldBackgroundColor: appTheme.scaffoldBackgroundColor,
    textColor: appTheme.textColor,
    buttonBackgroundColor: rowBackgroundColor,
    buttonTextColor: appTheme.textColor,
    borderColor: appTheme.borderColor,
    dividerColor: appTheme.dividerColor,
  );
});

TextStyle get sectionHeaderStyle => TextStyle(
      fontSize: isCupertino() ? 20 : 17,
      fontWeight: isCupertino() ? FontWeight.w600 : FontWeight.w500,
      letterSpacing: isCupertino() ? -1 : 0,
    );
