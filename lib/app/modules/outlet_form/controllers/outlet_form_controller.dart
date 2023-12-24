import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jtn/app/helpers/transaction_type_helper.dart';
import 'package:jtn/app/models/currency_tipe_model.dart';
import 'package:jtn/config/color_constants.dart';
import 'package:jtn/config/constant.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../config/function_utils.dart';
import '../../../models/outlet_subs_models.dart';

class OutletFormController extends GetxController {
  final box = GetStorage();
  final transactionType = ''.obs;
  final listOutlets = <OutletSubsModel>[];
  final listCurrencyType = <CurrencyTipeModel>[].obs;

  // var listImages = [];

  var image1Path = ''.obs;
  var image2Path = ''.obs;
  var image3Path = ''.obs;
  var image4Path = ''.obs;

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

  void pickImage(int index) async {
    var status = await Permission.photos.status;
    if (status.isDenied) {
      await Permission.photos.request();
    }
    status = await Permission.photos.status;
    if (status.isDenied) {
      return;
    }
    ImagePicker picker = ImagePicker();
    logKey('status', status);
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (image == null) {
      return;
    }
    if (index == 1) {
      image1Path.value = image.path;
    } else if (index == 2) {
      image2Path.value = image.path;
    } else if (index == 3) {
      image3Path.value = image.path;
    } else if (index == 4) {
      image4Path.value = image.path;
    }
    final a = await image.readAsBytes();
    logKey('a', a.length);
  }

  void deleteImage(int index) async {
    final res = await Get.defaultDialog(
          textConfirm: 'Delete',
          middleText: 'Delete this image ?',
          backgroundColor: Colors.white,
          buttonColor: kPrimaryColor2,
          onConfirm: () {
            Get.back(
              result: true,
            );
          },
          onCancel: () {},
        ) ??
        false;
    if (!res) {
      return;
    }
    if (index == 1) {
      image1Path.value = '';
    } else if (index == 2) {
      image2Path.value = '';
    } else if (index == 3) {
      image3Path.value = '';
    } else if (index == 4) {
      image4Path.value = '';
    }
  }

  void submitMasuk() {
    final res = formKey.currentState!.saveAndValidate();
    if (!res) {
      return;
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
