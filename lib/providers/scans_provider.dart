


import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:qr_reader/providers/db_provider.dart';

class ScansProvider extends ChangeNotifier{

List <ScanModel> scans =[];
bool isLoading=false;
String typeSelected='http';

Future <ScanModel> newScan (String value)async{
  final newScan=ScanModel(value: value);
  final id=await DBProvider.db.newScan(newScan);
  //Le asigno al modelo el id de la base de datos
  newScan.id=id;
 if(typeSelected==newScan.type){
  scans.add(newScan);
  }
  notifyListeners();
  return newScan;
}

uploadScans()async{
  final scanss=await DBProvider.db.getAllScans();
  scans=[...scanss!];
  notifyListeners();

}


uploadScansByType(String type)async{
  isLoading=true;
    await Future.delayed(Duration(seconds: 2));
    final scans=await DBProvider.db.getScansByType(type);
    this.scans=[...scans!];
   isLoading=false;
    typeSelected=type;
  notifyListeners();
}


deleteAllScans()async{
await DBProvider.db.deleteAllScans();
scans=[];
notifyListeners();
}


deleteScanByid(int id)async{
await DBProvider.db.deleteScan(id);
uploadScansByType(typeSelected);
}
}