class RowToteEntity{
  String pickListCode;
  String storeEtonCode;
  int pickedQty;
  int qty;
  String tote;
  bool isFinish;

  RowToteEntity({
    this.pickListCode,
    this.storeEtonCode,
    this.pickedQty,
    this.qty,
    this.tote,
    this.isFinish,
});

  factory RowToteEntity.fromJson(Map<String, dynamic> json){
    return RowToteEntity(
      pickListCode: json["PickListCode"],
      storeEtonCode: json["StoreEtonCode"],
      pickedQty: json["PickedQty"],
      qty: json["Qty"],
      tote: json["Tote"],
      isFinish: json["IsFinish"],
    );
  }
}