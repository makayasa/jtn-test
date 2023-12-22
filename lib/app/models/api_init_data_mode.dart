import 'package:jtn/app/models/currency_tipe_model.dart';
import 'package:jtn/app/models/outlet_model.dart';
import 'package:jtn/app/models/outlet_subs_models.dart';
import 'package:jtn/app/models/pay_tipe_model.dart';
import 'package:jtn/app/models/status_model.dart';
import 'package:jtn/app/models/trx_tipe_model.dart';
import 'package:jtn/config/function_utils.dart';

class ApiInitdataModel {
  StatusModel status;
  DataInitdata data;
  Map<String, dynamic> debugParamSent;
  String debugLive;

  ApiInitdataModel({
    required this.status,
    required this.data,
    required this.debugParamSent,
    required this.debugLive,
  });

  factory ApiInitdataModel.fromJson(Map<String, dynamic> json) => ApiInitdataModel(
        status: StatusModel.fromJson(json['status']),
        data: DataInitdata.fromJson(json['data']),
        debugParamSent: json['debug-param-sent'],
        debugLive: json['debug-live'],
      );

  factory ApiInitdataModel.init() => ApiInitdataModel(
        status: StatusModel.init(),
        data: DataInitdata.init(),
        debugParamSent: {},
        debugLive: '',
      );

  Map<String, dynamic> toJson() => {
        'status': status.toJson(),
        'data': data.toJson(),
        'debug-param-sent': debugParamSent,
        'debug-live': debugLive,
      };
}

class DataInitdata {
  DataInitdata({
    required this.outlet,
    required this.outletSubs,
    required this.trxTipe,
    required this.payTipe,
    required this.curTipe,
  });
  OutletModel outlet;
  List<OutletSubsModel> outletSubs;
  List<TrxTipeModel> trxTipe;
  List<PayTipeModel> payTipe;
  List<CurrencyTipeModel> curTipe;

  factory DataInitdata.fromJson(Map<String, dynamic> json) {
    return DataInitdata(
      outlet: OutletModel.fromJson(json['outlet']),
      outletSubs: List<OutletSubsModel>.from(json['outlet_subs'].map((e) => OutletSubsModel.fromJson(e))),
      trxTipe: List<TrxTipeModel>.from(json['trx_tipe'].map((e) => TrxTipeModel.fromJson(e))),
      payTipe: List<PayTipeModel>.from(json['pay_tipe'].map((e) => PayTipeModel.fromJson(e))),
      curTipe: List<CurrencyTipeModel>.from(json['cur_tipe'].map((e) => CurrencyTipeModel.fromJson(e))),
    );
  }

  factory DataInitdata.init() => DataInitdata(
        outlet: OutletModel.init(),
        outletSubs: [],
        trxTipe: [],
        payTipe: [],
        curTipe: [],
      );

  Map<String, dynamic> toJson() => {
        'outlet': outlet.toJson(),
        "outlet_subs": List<Map<String, dynamic>>.from(outletSubs.map((e) => e.toJson())),
        "trx_tipe": List<Map<String, dynamic>>.from(trxTipe.map((e) => e.toJson())),
        "pay_tipe": List<Map<String, dynamic>>.from(payTipe.map((e) => e.toJson())),
        "cur_tipe": List<Map<String, dynamic>>.from(curTipe.map((e) => e.toJson())),
      };
}
