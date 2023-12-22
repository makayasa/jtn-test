class CurrencyTipeModel {
  CurrencyTipeModel({
    required this.id,
    required this.name,
    required this.logo,
    required this.desc,
  });
  String id;
  String name;
  String logo;
  String desc;

  factory CurrencyTipeModel.fromJson(Map<String, dynamic> json) => CurrencyTipeModel(
        id: json['ct_id'],
        name: json['ct_nama'],
        logo: json['ct_logo'],
        desc: json['ct_ket'],
      );

  factory CurrencyTipeModel.init() => CurrencyTipeModel(
        id: '',
        name: '',
        logo: '',
        desc: '',
      );

  Map<String, dynamic> toJson() => {
        "ct_id": id,
        "ct_nama": name,
        "ct_logo": logo,
        "ct_ket": desc,
      };

  // {
  //   "ct_id": "4",
  //   "ct_nama": "EUR",
  //   "ct_logo": "€",
  //   "ct_ket": "Euro",
  // }
}
