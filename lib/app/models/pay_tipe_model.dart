class PayTipeModel {
  PayTipeModel({
    required this.id,
    required this.name,
    required this.desc,
    required this.qrisData,
    required this.qrisImage,
    required this.byrHttp,
    required this.outletId,
    required this.delStatus,
  });

  String id;
  String name;
  String desc;
  String qrisData;
  String qrisImage;
  String byrHttp;
  String outletId;
  String delStatus;

  factory PayTipeModel.fromJson(Map<String, dynamic> json) => PayTipeModel(
        id: json['byr_id'],
        name: json['byr_nama'],
        desc: json['byr_desc'],
        qrisData: json['byr_qris_data'],
        qrisImage: json['byr_qris_image'],
        byrHttp: json['byr_http'],
        outletId: json['outlet_id'],
        delStatus: json['del_status'],
      );

  factory PayTipeModel.init() => PayTipeModel(
        id: '',
        name: '',
        desc: '',
        qrisData: '',
        qrisImage: '',
        byrHttp: '',
        outletId: '',
        delStatus: '',
      );

  Map<String, dynamic> toJson() => {
        "byr_id": id,
        "byr_nama": name,
        "byr_desc": desc,
        "byr_qris_data": qrisData,
        "byr_qris_image": qrisImage,
        "byr_http": byrHttp,
        "outlet_id": outletId,
        "del_status": delStatus,
      };

  //  {
  //   "byr_id": "1",
  //   "byr_nama": "TUNAI",
  //   "byr_desc": "",
  //   "byr_qris_data": "",
  //   "byr_qris_image": "",
  //   "byr_http": "",
  //   "outlet_id": "1",
  //   "del_status": "0",
  // }
}
