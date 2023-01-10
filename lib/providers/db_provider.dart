
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:qr_reader/models/scan_model.dart';
export 'package:qr_reader/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider{
 
  static Database? _database;
  static final DBProvider db= DBProvider._();


//constructor privado
  DBProvider._();
get deleteDatabase async{
    
}
  Future<Database> get database async {
     if (_database !=null){
      return _database!;
     }

     _database =await initDB();
     return _database!;
  }
//RETORNA UNA BASE DE DATOS
 Future<Database> initDB() async{
  //Path de donde almacenaremos la base de datos en el espacio respectivo de la app cuando se instale.
       Directory documentsDirectory =await getApplicationDocumentsDirectory();
       final path =join(documentsDirectory.path, 'Scans.db');
      // print(path);
   // databaseFactory.deleteDatabase(path);

  // Creacion de la base de datos
   return await openDatabase(
      path,
      version: 1,
      onOpen: (db) { },
      onCreate: ( Database db, int version ) async {

        await db.execute('''
          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY,
            tipo TEXT,
            valor TEXT
          )
        ''');
      }
    );

  }


Future <int> newScanRaw(ScanModel newScan)async{
final id =newScan.id;
final type=newScan.type;
final value=newScan.value;


final db =await database;
final res=await db.rawInsert('''
   INSERT INTO Scans(id,type,value)
   VALUES($id, '$type', '$value')
   

''');

return res;

}


Future <int> newScan(ScanModel newScan)async{
  final db=await database;
  //nombre de la tabla- mapa con los valores a insertar.
  final res=await db.insert('Scans', newScan.toJson());
  print(newScan.toJson());

  //El res es el id del ult registro insertado
  return res;

}

Future<ScanModel?> getScanById(int id) async {
    final db = await database;
  
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);
 
    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }


}