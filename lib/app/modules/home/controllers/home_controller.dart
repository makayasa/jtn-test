import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jtn/app/controllers/dio_controller.dart';
import 'package:jtn/app/helpers/transaction_type_helper.dart';
import 'package:jtn/app/models/api_init_data_mode.dart';
import 'package:jtn/app/models/api_trx_get_model.dart';
import 'package:jtn/app/routes/app_pages.dart';
import 'package:jtn/config/environment.dart';
import 'package:jtn/config/function_utils.dart';
import 'package:dio/dio.dart' as dio;

import '../../../../config/constant.dart';

class HomeController extends GetxController {
  final box = GetStorage();
  final dioC = Get.find<DioController>();
  final positioned = 0.0.obs;
  final isLoading = true.obs;

  final double constPotioned = -(Get.mediaQuery.size.width - kDefaultScaffoldPadding.horizontal / 2) + 10 + 125;

  final initData = ApiInitdataModel.init().obs;

  // final listBoolSlider = <RxBool>[].obs;

  final isSlideOpen = false.obs;

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

  void switchSlider() {
    // listBoolSlider[index].value = !listBoolSlider[index].value;
    isSlideOpen.value = !isSlideOpen.value;
  }

  void goToForm(int transactionTypeCode) {
    final typeTransaction = TransactionTypeHelper.helperCode(transactionTypeCode);
    logKey('typeTransaction', typeTransaction);
    // if (index == 0) {
    //   logKey('ini induk');
    // } else {
    //   index = index - 1;
    //   logKey('ini bukan');
    //   final data = initData.value.data.outletSubs[index];
    //   logKey('data ke form', initData.value.data.outletSubs[index].outletName);
    // }
    final argument = {
      'outlet': initData.value.data.outlet.toJson(),
      'list_sub_outlet': List.from(initData.value.data.outletSubs.map((e) => e.toJson())),
      'transaction_type': transactionTypeCode,
    };
    Get.toNamed(
      Routes.OUTLET_FORM,
      arguments: argument,
    );
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
      final currType = [];
      for (var curr in data.data.curTipe) {
        currType.add(curr.toJson());
      }
      box.write(kListCurrencyKey, currType);

      // //* +1 karena ditambah induk
      // for (var i = 0; i < data.data.outletSubs.length + 1; i++) {
      //   var isOpen = false.obs;
      //   listBoolSlider.add(isOpen);
      // }
      initData.refresh();
      // logKey('data initData', data.data.outlet.outletName);
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
