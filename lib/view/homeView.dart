import 'package:flutter/material.dart';
import 'package:primeiro_app_flutter/model/homeModel.dart';
import 'package:primeiro_app_flutter/presenter/homePresenter.dart';
import 'package:primeiro_app_flutter/view/stateDataView.dart';

class HomeView extends StatefulWidget {
  final String title;
  final HomePresenter homePresenter;

  HomeView(this.homePresenter, {this.title, Key key}) : super(key: key);
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> implements StateDataView {

  HomeModel _homeModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _homeModel.numberOneED,
          ),
          TextField(controller: _homeModel.numberTwoED,
          ),
          RaisedButton(
            onPressed: () => this.widget.homePresenter.buttonClick(),
            child: Icon(Icons.add),
          ),
          Text(
            "Result: ${_homeModel.result}",
            style: TextStyle(fontSize: 30),
          )
        ],
      ),
    );
  }

  @override
  void updateData(HomeModel homeModel) {
    setState(() {
      this._homeModel = homeModel;
    });
  }

  @override
  void initState() {
    super.initState();
    this.widget.homePresenter.updateDataView = this;

  }
}
