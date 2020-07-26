import 'package:primeiro_app_flutter/view/stateDataView.dart';
import 'package:primeiro_app_flutter/model/homeModel.dart';

class HomePresenter {
  set updateDataView(StateDataView stateDataView){}
  void buttonClick(){}
}

class SetupPresenter implements HomePresenter {
  HomeModel _homeModel;
  StateDataView _stateDataView;

  SetupPresenter() {
    this._homeModel = HomeModel();
  }

  @override
  void set updateDataView(StateDataView stateDataView) {
    _stateDataView = stateDataView;
    this._stateDataView.updateData(this._homeModel);
  }

  @override
  void buttonClick() {
    int valueOne = int.parse(this._homeModel.numberOneED.text);
    int valueTwo = int.parse(this._homeModel.numberTwoED.text);

    this._homeModel.result = valueOne + valueTwo;
    this._stateDataView.updateData(this._homeModel);
  }
  
}