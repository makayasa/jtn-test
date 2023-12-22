class TrxTipeModel {
  TrxTipeModel({
    required this.id,
    required this.name,
    required this.trx,
    required this.outletId,
    required this.delStatus,
  });

  String id;
  String name;
  String trx;
  String outletId;
  String delStatus;

  factory TrxTipeModel.fromJson(Map<String, dynamic> json) => TrxTipeModel(
        id: json['id'],
        name: json['nama'],
        trx: json['trx'],
        outletId: json['outlet_id'],
        delStatus: json['del_status'],
      );

  factory TrxTipeModel.init() => TrxTipeModel(
        id: '',
        name: '',
        trx: '',
        outletId: '',
        delStatus: '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": name,
        "trx": trx,
        "outlet_id": outletId,
        "del_status": delStatus,
      };

  // {
  //   "id": "1",
  //   "nama": "Masuk",
  //   "trx": "debet",
  //   "outlet_id": "1",
  //   "del_status": "0",
  // }
}
