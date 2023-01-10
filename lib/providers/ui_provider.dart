import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier{
  int _selectedMenuOpt=1;

  int get selectedMenuOpt{
    return this._selectedMenuOpt;
  }

  set selectedMenuOpt (int i ){
    this._selectedMenuOpt=i;
    //cuando se cambie el valor, llama la instruccion que notifica a todas los widgets que esten escuchando el cambio.
    notifyListeners();
    
  }


}