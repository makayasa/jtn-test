import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jtn/app/controllers/dio_controller.dart';
import 'package:jtn/app/helpers/transaction_type_helper.dart';
import 'package:jtn/app/models/currency_tipe_model.dart';
import 'package:jtn/config/color_constants.dart';
import 'package:jtn/config/constant.dart';
import 'package:jtn/config/environment.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

import '../../../../config/function_utils.dart';
import '../../../models/outlet_subs_models.dart';

class OutletFormController extends GetxController {
  final dioC = Get.find<DioController>();
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

  Future<({dynamic photo1, dynamic photo2, dynamic photo3, dynamic photo4})> photoComression() async {
    dynamic photo1;
    dynamic photo2;
    dynamic photo3;
    dynamic photo4;
    double maxSize = 300;
    var temp = [];
    if (isNotEmpty(image1Path.value)) {
      temp.add(image1Path.value);
    }
    if (isNotEmpty(image2Path.value)) {
      temp.add(image2Path.value);
    }
    if (isNotEmpty(image3Path.value)) {
      temp.add(image3Path.value);
    }
    if (isNotEmpty(image4Path.value)) {
      temp.add(image4Path.value);
    }

    maxSize = maxSize / temp.length;

    logKey('maxSize', temp);
    logKey('maxSize', maxSize);

    var quality = 60;
    if (isNotEmpty(image1Path.value)) {
      var res = await FlutterImageCompress.compressWithFile(
        image1Path.value,
        quality: quality,
        // format: CompressFormat.png,
      );
      var size = res!.lengthInBytes / (1024 ^ 2);
      while (size >= 200) {
        quality -= 5;
        res = await FlutterImageCompress.compressWithList(
          res!,
          quality: quality,
        );
        size = res.lengthInBytes / (1024 ^ 2);
        logKey('size 1', size);
      }
      var base64 = base64Encode(res!.toList());
      logKey('sizePhoto 1', size);
      photo1 = base64;
      quality = 60;
      // photo1 = res;
    }
    if (isNotEmpty(image2Path.value)) {
      var res = await FlutterImageCompress.compressWithFile(
        image2Path.value,
        quality: quality,
        // format: CompressFormat.png,
      );
      var size = res!.lengthInBytes / (1024 ^ 2);
      while (size >= 200) {
        quality -= 5;
        res = await FlutterImageCompress.compressWithList(
          res!,
          quality: quality,
        );
        size = res.lengthInBytes / (1024 ^ 2);
      }
      var base64 = base64Encode(res!.toList());

      logKey('sizePhoto 2', size);
      photo2 = base64;
      quality = 60;
      // photo2 = res;
    }
    if (isNotEmpty(image3Path.value)) {
      var res = await FlutterImageCompress.compressWithFile(
        image3Path.value,
        quality: 60,
        // format: CompressFormat.png,
      );
      var size = res!.lengthInBytes / (1024 ^ 2);
      while (size >= 200) {
        quality -= 5;
        res = await FlutterImageCompress.compressWithList(
          res!,
          quality: quality,
        );
        size = res.lengthInBytes / (1024 ^ 2);
      }
      var base64 = base64Encode(res!.toList());
      logKey('sizePhoto 3', size);
      photo3 = base64;
      quality = 60;
    }
    if (isNotEmpty(image4Path.value)) {
      var res = await FlutterImageCompress.compressWithFile(
        image4Path.value,
        quality: 60,
      );
      var size = res!.lengthInBytes / (1024 ^ 2);
      while (size >= 200) {
        quality -= 5;
        res = await FlutterImageCompress.compressWithList(
          res!,
          quality: quality,
        );
        size = res.lengthInBytes / (1024 ^ 2);
      }
      logKey('sizePhoto 4', size);
      var base64 = base64Encode(res!.toList());
      photo4 = base64;
      quality = 60;
    }

    return (
      photo1: photo1,
      photo2: photo2,
      photo3: photo3,
      photo4: photo4,
    );
  }

  void submit() async {
    final res = formKey.currentState!.saveAndValidate();
    final value = formKey.currentState!.value;
    if (!res) {
      return;
    }
    dialogLoading();
    logKey('value', value);
    DateTime date = value['start_date'];
    String parse = date.toString();
    final photo = await photoComression();
    final body = {
      "act": "trxAdd",
      "outlet_id": 1,
      "user_id": 1,
      "data": {
        "ptipe": TransactionTypeHelper.helperString(transactionType.value),
        "curr_id": int.parse(value['currency']),
        "nominal": '${value['nominal']}',
        "ket": value.containsKey('title') ? 'judul = ${value['title'] ?? ''}, ket = ${value['desc'] ?? ''}' : value['desc'] ?? '',
        "outlet_id1": int.parse(value['outlet_from']),
        "outlet_id2": int.parse(value['outlet_to'] ?? '0'),
        // "outlet_id2": 0,
        // "tgl": "2022-02-04",
        "tgl": parse.split(" ").first,
        "photo1": photo.photo1 ?? '',
        "photo2": photo.photo2 ?? '',
        "photo3": photo.photo3 ?? '',
        "photo4": photo.photo4 ?? '',
      },
    };
    logKey('body', body);
    // return;
    try {
      dio.Response res = await dioC.post(
        '$baseUrl/Trx/Add',
        body: body,
      );
      logKey('res', res);
      // Get.close(2);
      Get.back();
      Get.back(result: true);
      showToast('data submitted');
    } on dio.DioException catch (e) {
      showToast('submit error ${e.message}');
      logKey('error submit', e.message);
      Get.back();
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
}
