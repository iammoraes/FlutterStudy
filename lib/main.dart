import 'package:flutter/material.dart';
import 'file:///C:/Users/Regina/AndroidStudioProjects/primeiro_app_flutter/lib/view/screens/dayQuotesView.dart';
import 'package:primeiro_app_flutter/presenter/dayQuotesPresenter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var _title = "Frases do dia";
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DayQuotes(new SetupPresenter(), title: _title),
    );
  }
}
