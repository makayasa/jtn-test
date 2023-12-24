import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_constants.dart';

const kListCurrencyKey = 'kListCurrencyKey';

const kDateFormat = 'dateFormat = "EEEE, dd MMMM - HH:mm';
const kDateFormat2 = 'dateFormat = "EEEE';

const kNotificationChannelId = 'my_foreground';
const notificationId = 888;

TextStyle get kDefaultTextStyle {
  return GoogleFonts.roboto(
    color: kBgBlack,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );
}

InputDecoration kDefaultInputDecoration(String hintText) {
  return InputDecoration.collapsed(
    floatingLabelAlignment: FloatingLabelAlignment.center,
    hintText: hintText,
    hintStyle: kDefaultTextStyle.copyWith(
      color: kPrimaryColor,
      fontWeight: FontWeight.bold,
    ),
  );
}

const kDropdownStyleData = DropdownStyleData(
  offset: Offset(0.0, -20.0),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: kDefaultBorderRadius10,
  ),
);

const kDefaultCurve = Curves.easeInOutCirc;
const kDefaultFastDuration = Duration(milliseconds: 250);
const kDefaultDuration = Duration(milliseconds: 500);

const kDefaultScaffoldPadding = EdgeInsets.symmetric(horizontal: 10);

const kDefaultBorderRadius10 = BorderRadius.all(
  Radius.circular(10),
);
const kDefaultBorderRadius15 = BorderRadius.all(
  Radius.circular(15),
);
const kDefaultBorderRadius = BorderRadius.all(
  Radius.circular(5),
);
