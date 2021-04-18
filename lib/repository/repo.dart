import 'package:api_json/model/list_tote_entity.dart';
import 'package:api_json/service/list_tote_api.dart';

class Repository{
  Future<ListToteEntity> getListTote() async{
    return await ToteListApi().getListTote();
  }
}