import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:primeiro_app_flutter/model/jokenPoModel.dart';
import 'package:primeiro_app_flutter/presenter/jokenPoPresenter.dart';
import 'package:primeiro_app_flutter/view/stateDataView.dart';

class DayQuotes extends StatefulWidget {
  final String title;
  final JokenPoPresenter jokenPoPresenter;

  DayQuotes(this.jokenPoPresenter, {this.title, Key key}) : super(key: key);

  _DayQuotesState createState() => _DayQuotesState();
}

class _DayQuotesState extends State<DayQuotes> implements StateDataView {
  JokenPoModel _jokenPoModel;

  var _tvTitle = 'Escolha do App:';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _tvTitle,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image(image: _jokenPoModel.image, height: 105),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _jokenPoModel.tvChoice,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => this.widget.jokenPoPresenter.onClick('stone'),
                child: Image.asset('images/pedra.png', height: 95),
              ),
              GestureDetector(
                onTap: () => this.widget.jokenPoPresenter.onClick('paper'),
                child: Image.asset('images/papel.png', height: 95),
              ),
              GestureDetector(
                onTap: () => this.widget.jokenPoPresenter.onClick('scissors'),
                child: Image.asset('images/tesoura.png', height: 95),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  void result(JokenPoModel jokenPoModel) {
    setState(() {
      this._jokenPoModel = jokenPoModel;
    });
  }

  @override
  void initState() {
    super.initState();
    this.widget.jokenPoPresenter.updateDataView = this;
  }
}
