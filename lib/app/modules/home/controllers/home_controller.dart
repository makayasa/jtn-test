
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jtn/app/controllers/dio_controller.dart';
import 'package:jtn/app/helpers/currency_type_helper.dart';
import 'package:jtn/app/models/api_init_data_mode.dart';
import 'package:jtn/app/models/api_trx_get_model.dart';
import 'package:jtn/app/models/trx_model.dart';
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

  final constPotioned = 0.0.obs;

  final initData = ApiInitdataModel.init().obs;

  final totalItems = 0.obs;
  final totalIdr = 0.obs;
  final totalUsd = 0.obs;
  final totalEur = 0.obs;
  final totalSgd = 0.obs;

  final listTrx = <TrxModel>[].obs;

  // final listBoolSlider = <RxBool>[].obs;

  final isSlideOpen = false.obs;

  void initialFunction() async {
    await login();
    await getInitData();
    await getTrx();
    isLoading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    initialFunction();
  }

  @override
  void onReady() {
    super.onReady();
    constPotioned.value = -(Get.mediaQuery.size.width - kDefaultScaffoldPadding.horizontal / 2) + 10 + 125;
    // positioned.value = constPotioned.value;
    positioned.value = 100;
  }

  void refreshHome() async {
    // dialogLoading();
    isLoading.value = true;
    listTrx.clear();
    totalIdr.value = 0;
    totalUsd.value = 0;
    totalEur.value = 0;
    totalSgd.value = 0;
    await getTrx();
    isLoading.value = false;
    // Get.back();
  }

  void calcItems() {
    totalItems.value = listTrx.length;
    for (var trx in listTrx) {
      // final currencyType = CurrencyTypeHelper.helperString(trx.currenyTipe);
      final currencyId = CurrencyTypeHelper.helperCurrencySymbol(trx.currenyTipe);
      if (currencyId == CurrencyTypeHelper.IDR) {
        totalIdr.value += int.tryParse(trx.nominal) ?? 0;
      } else if (currencyId == CurrencyTypeHelper.USD) {
        totalUsd.value += int.tryParse(trx.nominal) ?? 0;
      } else if (currencyId == CurrencyTypeHelper.SGD) {
        totalSgd.value += int.tryParse(trx.nominal) ?? 0;
      } else if (currencyId == CurrencyTypeHelper.EUR) {
        totalEur.value += int.tryParse(trx.nominal) ?? 0;
      }
    }
  }

  void switchSlider() {
    isSlideOpen.value = !isSlideOpen.value;
  }

  void goToForm(int transactionTypeCode) async {
    // final typeTransaction = TransactionTypeHelper.helperCode(transactionTypeCode);
    final argument = {
      'outlet': initData.value.data.outlet.toJson(),
      'list_sub_outlet': List.from(initData.value.data.outletSubs.map((e) => e.toJson())),
      'transaction_type': transactionTypeCode,
    };
    final res = await Get.toNamed(
      Routes.OUTLET_FORM,
      arguments: argument,
    );
    if (isNotEmpty(res)) {
      await getTrx();
    }
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
    } on dio.DioException catch (e) {
      showToast('error initData ${e.message}');
    }
  }

  Future<void> getTrx() async {
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
      listTrx.assignAll(data.data);
      calcItems();
      logKey('res getTrx', data.toJson());
      logKey('length', data.data.length);
    } on dio.DioException catch (e) {
      showToast('error getTrx ${e.message}');
    }
  }
}
