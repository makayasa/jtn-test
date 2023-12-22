import 'dart:convert';
import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

void logKey([key, content]) {
  String finalLog = '';
  dynamic tempContent = content ?? key;
  // if (!isDev) {
  //   return;
  // }
  if (tempContent is Map || tempContent is List) {
    try {
      finalLog = json.encode(tempContent);
    } catch (e) {
      finalLog = tempContent.toString();
    }
  } else if (tempContent is String) {
    finalLog = tempContent;
  } else {
    finalLog = tempContent.toString();
  }

  if (content != null) {
    dev.log('$key => $finalLog');
  } else {
    dev.log(finalLog);
  }
}

double doubleParse(args) {
  try {
    if (args is double) {
      return args;
    } else if (args is String) {
      return double.parse(args);
    } else {
      return double.parse(args.toString());
    }
  } catch (e) {
    return 0;
  }
}

int intParse(args) {
  try {
    if (args is int) {
      return args;
    } else if (args is String) {
      return int.parse(args);
    } else {
      return int.parse(args.toString());
    }
  } catch (e) {
    return 0;
  }
}

String currencyFormat(dynamic number) {
  try {
    if (number is String) {
      number = number.replaceAll(',', '');
      return NumberFormat("#,##0", "en_US").format(doubleParse(number));
    }
    if (number is double || number is int) {
      return NumberFormat("#,##0", "en_US").format(number);
    }
    return '-';
  } catch (e) {
    logKey('Error currencyFormat', e);
    return '-';
  }
}

void showToast(message, {bgColor, txtColor, ToastGravity gravity = ToastGravity.BOTTOM}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: gravity,
    timeInSecForIosWeb: 1,
    backgroundColor: bgColor,
    // ?? kPrimaryColor,
    textColor: txtColor ?? Colors.white,
    fontSize: 12.0,
  );
}

bool isEmpty(dynamic val) {
  return [
    "",
    " ",
    null,
    'null',
    '{}',
    '[]',
    '0',
    '0.0',
    '-1',
  ].contains(val.toString());
}

bool isNotEmpty(dynamic val) {
  return ![
    "",
    " ",
    null,
    'null',
    '{}',
    '[]',
    '0',
    '0.0',
    '0.00',
    '-1',
  ].contains(val.toString());
}
