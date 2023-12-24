import 'dart:async';
import 'dart:convert';
import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jtn/app/controllers/dio_controller.dart';
import 'package:jtn/config/constant.dart';
import 'package:jtn/config/environment.dart';

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

String dateFormater(dynamic date, {String dateFormat = kDateFormat, bool useTimezone = true}) {
  DateTime now = DateTime.now();
  DateTime tmpDate = DateTime.now();
  try {
    if (date is String) {
      tmpDate = DateTime.parse(date);
    } else if (date is DateTime) {
      tmpDate = date;
    }
    if (useTimezone) {
      tmpDate.add(now.timeZoneOffset);
    }
    return DateFormat(dateFormat, "ID").format(tmpDate);
  } catch (e) {
    return '';
  }
}

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    double value = double.parse(newValue.text.replaceAll('.', ''));
    final formatter = NumberFormat.decimalPattern('id_ID');
    String newText = formatter.format(value);
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

void dialogLoading({double? size}) {
  Get.dialog(
    // loadingCircle(size: size),
    SizedBox(
      height: size,
      width: size,
      child: const CircularProgressIndicator(),
    ),
    // loading(size: size),
    barrierDismissible: false,
  );
}

Future<void> initializeService() async {
  logKey();
  final serice = FlutterBackgroundService();

  const channel = AndroidNotificationChannel(
    kNotificationChannelId,
    'my foreground service',
    description: 'hit api for n seccond',
    importance: Importance.low,
  );

  final localNotif = FlutterLocalNotificationsPlugin();
  await localNotif.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(
        channel,
      );
  await serice.configure(
    iosConfiguration: IosConfiguration(),
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      autoStart: true,
      isForegroundMode: true,
      notificationChannelId: kNotificationChannelId,
      initialNotificationTitle: 'Awesome Service',
      initialNotificationContent: 'initializing',
      foregroundServiceNotificationId: notificationId,
    ),
  );
  serice.startService();
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) {
  final dioC = Get.put(DioController());
  Timer.periodic(const Duration(seconds: 5), (timer) {
    logKey('asd');
    dioC.post(
      '$baseUrl/BgService/Hit',
      // 'http://192.168.0.2:7070/',
      body: {
        'nama': 'Rifqi Rahmad Ichsan Makayasa Pratama',
        'email': 'rifqimakayasa@gmail.com',
        'nohp': '089603853935',
      },
    );
  });
}
