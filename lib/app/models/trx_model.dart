class TrxModel {
  TrxModel({
    required this.id,
    required this.name,
    required this.currenyTipe,
    required this.asalOutletName,
    required this.darikeOutletId,
    required this.darikeOutletName,
    required this.trxTanggal,
    required this.ptipe,
    required this.dateCreated,
    required this.nominal,
    required this.keterangan,
    required this.status,
    required this.isStok,
    required this.asalOutletId,
    required this.outletId,
  });

  String id;
  String name;
  String currenyTipe;
  String asalOutletName;
  String darikeOutletId;
  String darikeOutletName;
  String trxTanggal;
  String ptipe;
  String dateCreated;
  String nominal;
  String keterangan;
  String status;
  String isStok;
  String asalOutletId;
  String outletId;

  factory TrxModel.fromJson(Map<String, dynamic> json) => TrxModel(
        name: json['trx_ptipe_nama'],
        currenyTipe: json['trx_curtipe_var'],
        asalOutletName: json['trx_asal_outlet_nama'],
        darikeOutletId: json['trx_darike_outlet_id'],
        darikeOutletName: json['trx_darike_outlet_nama'],
        id: json['trx_id'],
        trxTanggal: json['trx_tgl'],
        ptipe: json['trx_ptipe'],
        dateCreated: json['trx_date_created'],
        nominal: json['trx_nominal'],
        keterangan: json['trx_ket'],
        status: json['trx_status'],
        isStok: json['trx_is_stok'],
        asalOutletId: json['trx_outlet_id'],
        outletId: json['trx_outlet_id'],
      );

  factory TrxModel.init() => TrxModel(
        id: '',
        name: '',
        currenyTipe: '',
        asalOutletName: '',
        darikeOutletId: '',
        darikeOutletName: '',
        trxTanggal: '',
        ptipe: '',
        dateCreated: '',
        nominal: '',
        keterangan: '',
        status: '',
        isStok: '',
        asalOutletId: '',
        outletId: '',
      );

  Map<String, dynamic> toJson() => {
        "trx_ptipe_nama": name,
        "trx_curtipe_var": currenyTipe,
        "trx_asal_outlet_nama": asalOutletName,
        "trx_darike_outlet_id": darikeOutletId,
        "trx_darike_outlet_nama": darikeOutletName,
        "trx_id": id,
        "trx_tgl": trxTanggal,
        "trx_ptipe": ptipe,
        "trx_date_created": dateCreated,
        "trx_nominal": nominal,
        "trx_ket": keterangan,
        "trx_status": status,
        "trx_is_stok": isStok,
        "trx_asal_outlet_id": asalOutletId,
        "trx_outlet_id": outletId,
      };

  // {
  //   "trx_ptipe_nama": "Masuk",
  //   "trx_curtipe_var": "Rp",
  //   "trx_asal_outlet_nama": "Induk",
  //   "trx_darike_outlet_id": "0",
  //   "trx_darike_outlet_nama": "",
  //   "trx_id": "346",
  //   "trx_tgl": "2023-02-04",
  //   "trx_ptipe": "1",
  //   "trx_date_created": "2023-02-16 11:48:22",
  //   "trx_nominal": "123",
  //   "trx_ket": "ini isi keterangan",
  //   "trx_status": "1",
  //   "trx_is_stok": "0",
  //   "trx_asal_outlet_id": "1",
  //   "trx_outlet_id": "1"
  // }
}
