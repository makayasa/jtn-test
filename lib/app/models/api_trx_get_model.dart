import 'package:jtn/app/models/status_model.dart';
import 'package:jtn/app/models/trx_model.dart';

class ApiTrxGetModel {
  ApiTrxGetModel({
    required this.status,
    required this.data,
    required this.debugParamSent,
    required this.debugLive,
  });
  StatusModel status;
  List<TrxModel> data;
  Map<String, dynamic> debugParamSent;
  String debugLive;

  factory ApiTrxGetModel.fromJson(Map<String, dynamic> json) => ApiTrxGetModel(
        status: StatusModel.fromJson(json['status']),
        data: List<TrxModel>.from(json['data'].map((e) => TrxModel.fromJson(e))),
        debugParamSent: json['debug-param-sent'],
        debugLive: json['debug-live'],
      );

  factory ApiTrxGetModel.init() => ApiTrxGetModel(
        status: StatusModel.init(),
        data: [],
        debugParamSent: {},
        debugLive: '',
      );

  Map<String, dynamic> toJson() => {
        'status': status.toJson(),
        'data': List<Map<String, dynamic>>.from(data.map((e) => e.toJson())),
        'debug-param-sent': debugParamSent,
        'debug-live': debugLive,
      };
}


// {
//   "status": {
//         "error": 0,
//         "login": true,
//         "user_id": "1",
//         "role": "Admin",
//         "api-ver": "0.1",
//         "dev-debug-param": "1"
//     },
//     "data":[
//       {
//             "trx_ptipe_nama": "Masuk",
//             "trx_curtipe_var": "Rp",
//             "trx_asal_outlet_nama": "Induk",
//             "trx_darike_outlet_id": "0",
//             "trx_darike_outlet_nama": "",
//             "trx_id": "346",
//             "trx_tgl": "2023-02-04",
//             "trx_ptipe": "1",
//             "trx_date_created": "2023-02-16 11:48:22",
//             "trx_nominal": "123",
//             "trx_ket": "ini isi keterangan",
//             "trx_status": "1",
//             "trx_is_stok": "0",
//             "trx_asal_outlet_id": "1",
//             "trx_outlet_id": "1"
//         },
//         {
//             "trx_ptipe_nama": "Keluar",
//             "trx_curtipe_var": "Rp",
//             "trx_asal_outlet_nama": "Asia",
//             "trx_darike_outlet_id": "0",
//             "trx_darike_outlet_nama": "",
//             "trx_id": "340",
//             "trx_tgl": "2022-09-29",
//             "trx_ptipe": "2",
//             "trx_date_created": "2022-09-29 16:44:40",
//             "trx_nominal": "991",
//             "trx_ket": "judul = test kurang 991, ket = test kurang 991",
//             "trx_status": "1",
//             "trx_is_stok": "0",
//             "trx_asal_outlet_id": "10",
//             "trx_outlet_id": "1"
//         },
//     ],
//      "debug-param-sent": {
//         "{\"act\":\"trxGet\",\"outlet_id\":1,\"user_id\":1,\"data\":{\"trx_id\":0,\"status\":1,\"date_start\":\"\",\"date_end\":\"\"}}": ""
//     },
//     "debug-live": ""
// };
