class OutletSubsModel {
  OutletSubsModel({
    required this.id,
    required this.outletName,
    required this.parentId,
    required this.orderId,
  });

  String id;
  String outletName;
  String parentId;
  String orderId;

  factory OutletSubsModel.fromJson(Map<String, dynamic> json) => OutletSubsModel(
        id: json['id'],
        outletName: json['outlet_name'],
        parentId: json['parent_id'],
        orderId: json['order_id'],
      );

  factory OutletSubsModel.init() => OutletSubsModel(
        id: '',
        outletName: '',
        parentId: '',
        orderId: '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "outlet_name": outletName,
        "parent_id": parentId,
        "order_id": orderId,
      };

  // {
  //   "id": "2",
  //   "outlet_name": "AQUA",
  //   "parent_id": "1",
  //   "order_id": "0",
  // }
}
