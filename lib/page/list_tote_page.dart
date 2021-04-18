import 'package:api_json/bloc/bloc_base.dart';
import 'package:api_json/model/row_tote_entity.dart';
import 'package:api_json/page/list_tote_bloc.dart';
import 'package:flutter/material.dart';

class ToteListPage extends StatefulWidget {
  @override
  _ToteListPageState createState() => _ToteListPageState();
}

class _ToteListPageState extends State<ToteListPage> {
  ToteListBloc bloc;
  String pickListCode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = BlocProvider.of<ToteListBloc>(context);
    bloc.getListTote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tote List'),),
      body: Column(
        children: [
          Padding(padding: const EdgeInsets.all(10),
          child: _textInput(),
          ),
          Expanded(child: _listTote()),
        ],
      ),
    );
  }

  Widget _listTote() {
    return StreamBuilder(
      stream: bloc.toteListStream,
      builder: (BuildContext context,
          AsyncSnapshot<List<RowToteEntity>> snapshot) {
        if (snapshot.hasError) {
          return snapshot.error;
        }
        pickListCode = snapshot.data[0].pickListCode;
        return GridView.builder(
          padding: const EdgeInsets.all(10),
          scrollDirection: Axis.vertical,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
            return _gridViewBuilder(snapshot.data[index]);
          },
        );
      });
  }

  Widget _gridViewBuilder(RowToteEntity entity) {
    return GestureDetector(
      child: Card(
        child: Column(
          children: [
            Text(
              entity.storeEtonCode,
              style: TextStyle(color: Colors.white, fontSize: 25),
              textAlign: TextAlign.center,
            ),
            Text(
              entity.tote,
              style: TextStyle(color: Colors.white, fontSize: 25),
              textAlign: TextAlign.center,
            ),
            Text(
              entity.qty.toString(),
              style: TextStyle(color: Colors.white, fontSize: 25),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _textInput(){
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: Colors.deepOrangeAccent,
            width: 1,
          ),
        ),
      ),
    );
  }
}


