import 'package:api_json/bloc/bloc_base.dart';
import 'package:api_json/page/list_tote_bloc.dart';
import 'package:api_json/page/list_tote_page.dart';
import 'package:api_json/router/router_name.dart';
import 'package:flutter/material.dart';

class CustomerRouter {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    switch (settings.name) {
      case router_ListTote:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
              child: ToteListPage(),
              bloc: ToteListBloc(),
            ));
        return MaterialPageRoute(builder: (_) => null);
    }
  }
}