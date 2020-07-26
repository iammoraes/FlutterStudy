import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:primeiro_app_flutter/model/jokenPoModel.dart';
import 'package:primeiro_app_flutter/view/stateDataView.dart';

class JokenPoPresenter {
  set updateDataView(StateDataView stateDataView) {}

  void onClick(String option) {}
}

class SetupPresenter implements JokenPoPresenter {
  JokenPoModel _jokenPoModel;
  StateDataView _stateDataView;

  SetupPresenter() {
    this._jokenPoModel = JokenPoModel();
  }

  @override
  void set updateDataView(StateDataView stateDataView) {
    _stateDataView = stateDataView;
    this._stateDataView.result(this._jokenPoModel);
  }

  @override
  void onClick(String option) {
    var optionApp = ['paper', 'stone', 'scissors'];
    var index = Random().nextInt(3);
    var choiceApp = optionApp[index];

    switch (choiceApp) {
      case 'stone':
        {
          this._jokenPoModel.image = AssetImage('images/pedra.png');
        }
        break;
      case 'paper':
        {
          this._jokenPoModel.image = AssetImage('images/papel.png');
        }
        break;
      case 'scissors':
        {
          this._jokenPoModel.image = AssetImage('images/tesoura.png');
        }
        break;
    }

    if ((option == 'stone' && choiceApp == 'scissors') ||
        (option == 'scissors' && choiceApp == 'paper') ||
        (option == 'paper' && choiceApp == 'stone')) {

      this._jokenPoModel.tvChoice = 'Parabéns!!! Você ganhou';

    } else if ((option == 'scissors' && choiceApp == 'stone') ||
        (option == 'paper' && choiceApp == 'scissors') ||
        (option == 'stone' && choiceApp == 'paper')) {

      this._jokenPoModel.tvChoice = 'Você perdeu :(';

    }else{

      this._jokenPoModel.tvChoice = 'Empatamos ;)';

    }

    this._stateDataView.result(this._jokenPoModel);
  }
}
