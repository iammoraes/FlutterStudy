import 'package:flutter/material.dart';
import 'package:primeiro_app_flutter/model/dayQuotesModel.dart';
import 'package:primeiro_app_flutter/presenter/dayQuotesPresenter.dart';
import 'package:primeiro_app_flutter/view/stateDataView.dart';

class DayQuotes extends StatefulWidget {
  final String title;
  final DayQuotesPresenter dayQuotesPresenter;

  DayQuotes(this.dayQuotesPresenter, {this.title, Key key}) : super(key: key);
  _DayQuotesState createState() => _DayQuotesState();
}

class _DayQuotesState extends State<DayQuotes> implements StateDataView {
  DayQuotesModel _dayQuotesModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset('images/logo.png', width: 280, height: 100),
                Text(
                  _dayQuotesModel.quotes,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.black54),
                ),
                SizedBox(
                  width: 280,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.green)),
                    onPressed: () =>
                        this.widget.dayQuotesPresenter.buttonClick(),
                    color: Colors.green,
                    textColor: Colors.white,
                    child: Text('Nova Frase'.toUpperCase(),
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }

  @override
  void updateQuotes(DayQuotesModel dayQuotesModel) {
    setState(() {
      this._dayQuotesModel = dayQuotesModel;
    });
  }

  @override
  void initState() {
    super.initState();
    this.widget.dayQuotesPresenter.updateDataView = this;
  }
}
