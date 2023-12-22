import 'package:get/get.dart';
import 'package:jtn/app/controllers/dio_controller.dart';
import 'package:jtn/app/models/api_init_data_mode.dart';
import 'package:jtn/app/models/api_trx_get_model.dart';
import 'package:jtn/config/environment.dart';
import 'package:jtn/config/function_utils.dart';
import 'package:dio/dio.dart' as dio;

import '../../../../config/constant.dart';

class HomeController extends GetxController {
  final dioC = Get.find<DioController>();
  final positioned = 0.0.obs;
  final isLoading = true.obs;

  final double constPotioned = -(Get.mediaQuery.size.width - kDefaultScaffoldPadding.horizontal / 2) + 10 + 125;

  final initData = ApiInitdataModel.init().obs;

  final listBoolSlider = <RxBool>[].obs;

  void initialFunction() async {
    await login();
    await getInitData();
    isLoading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    positioned.value = constPotioned;
    initialFunction();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void switchSlider(int index) {
    listBoolSlider[index].value = !listBoolSlider[index].value;
  }

  Future<void> login() async {
    try {
      dio.Response res = await dioC.post(
        '$baseUrl/Auth',
        body: {"act": "LOGIN", "un": "admin@admin.com", "up": "admin"},
      );
      logKey('res login', res.data);
    } on dio.DioException catch (e) {
      showToast('error login ${e.message}');
    }
  }

  Future<void> getInitData() async {
    try {
      dio.Response res = await dioC.get(
        '$baseUrl/Auth/initData',
        body: {"act": "initData", "outlet_id": 1},
      );
      ApiInitdataModel data = ApiInitdataModel.fromJson(res.data);
      initData.value = data;

      //* +1 karena ditambah induk
      for (var i = 0; i < data.data.outletSubs.length + 1; i++) {
        var isOpen = false.obs;
        listBoolSlider.add(isOpen);
      }
      initData.refresh();
      logKey('data initData', data.data);
      // logKey('res initData', res.data);
    } on dio.DioException catch (e) {
      showToast('error initData ${e.message}');
    }
  }

  void getTrx() async {
    try {
      dio.Response res = await dioC.get(
        '$baseUrl/Trx/Get',
        body: {
          "act": "trxGet",
          "outlet_id": 1,
          "user_id": 1,
          "data": {"trx_id": 0, "status": 1, "date_start": "", "date_end": ""}
        },
      );
      var data = ApiTrxGetModel.fromJson(res.data);
      logKey('res getTrx', data.toJson());
      logKey('length', data.data.length);
    } on dio.DioException catch (e) {
      showToast('error getTrx ${e.message}');
    }
  }
}
