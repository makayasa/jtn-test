import 'package:flutter/material.dart';

// const kPrimaryColor = Color(0xFFA7727D);
// const kSecondaryColor = Color(0xFFEDDBC7);

const kPrimaryColorDarker = Color(0XFF2787bd);
const kPrimaryColor = Color(0XFF2787bd);
const kPrimaryColor2 = Color(0xFFc1dded);
const kPrimaryColor3 = Color(0xFFeff6fa);

const kSecondaryColor = Color(0xFFD4A373);
const kSecondaryColor2 = Color(0xFFFAEDCD);

const kWhiteMilk = Color(0xFFFEFAE0);

const kBgBlack = Color(0xFF191508);
const kBgWhite = Color(0xFFf8f8f8);
const kBgWhite2 = Color(0XFFf2f2f2);
const kGrey = Color(0xFF595959);
const kInactiveColor = Color(0xFFa6a6a6);
const kInactiveColor2 = Color(0xFFeaecf0);

const kIconTheme = IconThemeData(
  color: kPrimaryColor,
);

const kBotNavTheme = BottomNavigationBarThemeData(
  backgroundColor: kPrimaryColor,
  selectedItemColor: kPrimaryColor,
  unselectedItemColor: kInactiveColor,
);

final kPrimaryTheme = ThemeData(
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  primaryColor: kPrimaryColor,
  appBarTheme: const AppBarTheme(
    color: kPrimaryColor,
  ),
  iconTheme: kIconTheme,
  bottomNavigationBarTheme: kBotNavTheme,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: kPrimaryColor,
  ),
  iconButtonTheme: const IconButtonThemeData(
    style: ButtonStyle(
      iconColor: MaterialStatePropertyAll(kPrimaryColor),
    ),
  ),
  navigationBarTheme: NavigationBarThemeData(),
);

// const kElevationShadow = BoxShadow(
//   color: Colors.grey,
//   offset: Offset(0, 1),
//   blurRadius: 6.0,
// );

BoxShadow kElevationShadow({Color color = Colors.grey}) {
  return BoxShadow(
    color: color,
    offset: const Offset(2, 5),
    blurRadius: 6.0,
    spreadRadius: -3,
  );
}
