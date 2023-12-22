import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jtn/app/helpers/transaction_type_helper.dart';
import 'package:jtn/app/models/currency_tipe_model.dart';
import 'package:jtn/config/constant.dart';

import '../../../models/outlet_subs_models.dart';

class OutletFormController extends GetxController {
  final box = GetStorage();
  final transactionType = ''.obs;
  final listOutlets = <OutletSubsModel>[];
  final listCurrencyType = <CurrencyTipeModel>[].obs;

  final formKey = GlobalKey<FormBuilderState>();

  void initialFunction() async {
    final arg = Get.arguments;
    transactionType.value = TransactionTypeHelper.helperCode(arg['transaction_type']);
    final res = box.read(kListCurrencyKey);
    for (var i = 0; i < res.length; i++) {
      final curr = CurrencyTipeModel.fromJson(res[i]);
      listCurrencyType.add(curr);
    }
    for (var i = 0; i < arg['list_sub_outlet'].length; i++) {
      final outlet = OutletSubsModel.fromJson(arg['list_sub_outlet'][i]);
      listOutlets.add(outlet);
    }
  }

  @override
  void onInit() {
    super.onInit();
    initialFunction();
  }

  @override
  void onReady() {
    super.onReady();
    formKey.currentState!.fields['currency']!.didChange(listCurrencyType.first.id);
  }

  @override
  void onClose() {
    super.onClose();
  }
}
