import 'package:api_json/model/row_tote_entity.dart';

class ListToteEntity{
  bool status;
  List<RowToteEntity> row;
  String data;

  ListToteEntity({this.status, this.row, this.data});

  factory ListToteEntity.fromJson(Map<String, dynamic> json){
    return ListToteEntity(
      status: json["Status"],
      row: List<RowToteEntity>.from(json["Rows"].map((x) => RowToteEntity.fromJson(x))),
      data: json["Data"],
    );
  }
}