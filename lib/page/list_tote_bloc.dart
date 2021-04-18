import 'package:api_json/bloc/bloc_base.dart';
import 'package:api_json/model/row_tote_entity.dart';
import 'package:api_json/repository/repo.dart';
import 'package:rxdart/rxdart.dart';

class ToteListBloc extends BaseBloc{
  final _toteListController = BehaviorSubject<List<RowToteEntity>>();

  Stream<List<RowToteEntity>> get toteListStream => _toteListController.stream;

  Future getListTote() async {
    new Repository().getListTote().then((value) {
      _toteListController.sink.add(value.row);
    }).catchError((error) {
      _toteListController.addError(error);
    });
  }

  @override
  void dispose() {
    _toteListController.close();
  }

}