import 'package:flutter/material.dart';
import 'package:primeiro_app_flutter/view/homeView.dart';
import 'package:primeiro_app_flutter/presenter/homePresenter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter - MVP Architecture',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeView(new SetupPresenter(), title: 'Flutter Demo Home Page'),
    );
  }
}
