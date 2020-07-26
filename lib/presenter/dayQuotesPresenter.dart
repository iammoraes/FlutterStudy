import 'dart:math';
import 'package:primeiro_app_flutter/model/dayQuotesModel.dart';
import 'package:primeiro_app_flutter/view/stateDataView.dart';

class DayQuotesPresenter{
  set updateDataView(StateDataView stateDataView){}
  void buttonClick(){}
}

class SetupPresenter implements DayQuotesPresenter{
  DayQuotesModel _dayQuotesModel;
  StateDataView _stateDataView;

  SetupPresenter(){
    this._dayQuotesModel = DayQuotesModel();
}
  @override
  void buttonClick() {
    _setupQuotes();
  }

  @override
  void set updateDataView(StateDataView stateDataView) {
    _stateDataView = stateDataView;
    this._stateDataView.updateQuotes(this._dayQuotesModel);
  }

  void _setupQuotes() {
    var index = Random().nextInt(5);

    List<String> listQuotes = List();
    listQuotes.add('Ser feliz sem motivo é a mais autêntica forma de felicidade.');
    listQuotes.add('Não espere por uma crise para descobrir o que é importante em sua vida.');
    listQuotes.add('A alegria de fazer o bem é a única felicidade verdadeira.');
    listQuotes.add('Pessimismo leva à fraqueza, otimismo ao poder.');
    listQuotes.add('Daria tudo que sei pela metade do que ignoro.');

    this._dayQuotesModel.quotes = listQuotes[index];
    this._stateDataView.updateQuotes(this._dayQuotesModel);

  }

}