import 'dart:io';

import 'package:api_json/model/list_tote_entity.dart';
import 'package:dio/dio.dart';

class ToteListApi{

  Future<ListToteEntity> getListTote() async{
    var token = 'UddbMEQPCsFiciaiPLoMPIJUi1F0WIeKvghR2BrnURf';

    print('ApiTote: getTote');

    Dio dio = new Dio();
    dio.options.headers['content-type'] = 'application/json';
    dio.options.headers["Authorization"] = "Bearer $token";
    dio.interceptors.add(InterceptorsWrapper(
        onError: (error, handle){
          print('ApiTote error: ${error.message}');
        }
    ));

    var response = await Dio().get('http://ovr-sanbox.eton.vn/wft/v1/04/mdl/mdlpicklist');

    print('ApiTote response: $response');
    print('ApiTote statusCode: ${response.statusCode}');

    if (response.statusCode != HttpStatus.ok) {
      print('ApiTote has access ${response.statusMessage}');
      return new Future.error(response.statusMessage);
    }
    return ListToteEntity.fromJson(response.data);
  }
}