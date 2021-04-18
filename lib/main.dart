import 'package:api_json/router/customer_router.dart';
import 'package:api_json/router/router_name.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: CustomerRouter.allRoutes,
      initialRoute: router_ListTote,
    );
  }
}