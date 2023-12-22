// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:io';
import 'package:get_storage/get_storage.dart';
import 'package:jtn/config/function_utils.dart';
import 'package:mockito/mockito.dart';

import 'package:dio/dio.dart' as dio;
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:jtn/app/controllers/dio_controller.dart';
import 'package:jtn/app/models/status_model.dart';
import 'package:jtn/config/environment.dart';

class MockGetStorage extends Mock implements GetStorage {}

void main() async {
  setUpAll(() => HttpOverrides.global = null);

  MockGetStorage gs = MockGetStorage();
  // await gs.initStorage;

  test('test login', () async {
    final c = Get.put(DioController());
    try {
      dio.Response res = await c.post(
        '$baseUrl/Auth',
        isTest: true,
        body: {"act": "LOGIN", "un": "admin@admin.com", "up": "admin"},
      );
      final cookies = await c.cookieJar.loadForRequest(Uri.parse('$baseUrl/Auth'));
      // print(cookies.first.name);
      // print(cookies.first.domain);
      // print(cookies.first);
      await gs.write('cookies', cookies.first.toString().split(';').first);
      // var box = gs.read('cookies');
      // print('box $box');
    } catch (e) {}
  });

  test('check connectivity', () async {
    final c = Get.put(DioController());
    // final res = await c.checkConnection();
    try {
      dio.Response res = await c.post(
        '$baseUrl/Auth',
        isTest: true,
        body: {"act": "LOGIN", "un": "admin@admin.com", "up": "admin"},
      );
      // final cookies = await c.cookieJar.loadForRequest(Uri.parse('$baseUrl/Auth'));
      // print(cookies);
    } catch (e) {
      return;
    }
    try {
      final url = '$baseUrl/Auth/initData';
      dio.Response res = await c.get(
        url,
        body: {"act": "initData", "outlet_id": 1},
        isTest: true,
      );
      logKey('res.headers.map', res.headers.map);
      final cookies = await c.cookieJar.loadForRequest(Uri.parse(url));
      logKey('cookies', cookies);

      print(res.data['status']);
    } on dio.DioException catch (e) {}
    // expect(false, res.isConnected);
  });

  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);

  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();

  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });
}
