import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'package:qr_reader/models/scan_model.dart';
export 'package:qr_reader/models/scan_model.dart';


class DBProvider {

  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database> get database async {
    if ( _database != null ) return _database!;

    _database = await initDB();

    return _database!;

  }

  Future<Database> initDB() async{

    // Path de donde almacenaremos la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join( documentsDirectory.path, 'ScansDB.db' );
    print( path );

    // Crear base de datos
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) { },
      onCreate: ( Database db, int version ) async {

        await db.execute('''
          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY,
            type TEXT,
            value TEXT
          )
        ''');
      }
    );

  }

  Future<int> nuevoScanRaw( ScanModel newScan ) async {

    final id    = newScan.id;
    final type  = newScan.type;
    final value = newScan.value;

    // Verificar la base de datos
    final db = await database;

    final res = await db.rawInsert('''
      INSERT INTO Scans( id, tipo, valor )
        VALUES( $id, '$type', '$value' )
    ''');

    return res;
  }

  Future<int> newScan( ScanModel newScan ) async {

    final db = await database;
    final res = await db.insert('Scans', newScan.toJson() );

    // Es el ID del último registro insertado;
    return res;
  }

  Future<ScanModel?> getScanById( int id ) async {

    final db  = await database;
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);

    return res.isNotEmpty
          ? ScanModel.fromJson( res.first )
          : null;
  }


Future<List<ScanModel>?>getAllScans ()async{
  final db=await database;
  final res=await db.query('Scans');

if( res.isNotEmpty) {
  return res.map((e) => ScanModel.fromJson(e)).toList();
}
  else{
    return [];
  }

}

Future<List<ScanModel>?>getScansByType (String type)async{
  final db=await database;
  final res=await db.rawQuery('''
SELECT * FROM Scans WHERE TYPE = '$type'

''');

if( res.isNotEmpty) {
  return res.map((e) => ScanModel.fromJson(e)).toList();

}
  else{
    return [];
  }

}
//Con el rawUpdate o el rawQuery etc hay que especificar todo el query.
Future<int> updateScan(ScanModel newScan)async{
  final db=await database;
  //Si no le ponemos el where se actualizan TODOS los registros
  final res=await db.update('Scans', newScan.toJson(),where: 'id=?',whereArgs: [newScan.id]);
  return res;
}

Future<int>deleteScan(int id)async{
  final db=await database;
  final res=await db.delete('Scans', where: 'id=?',whereArgs: [id]);
  return res;
}

  Future<int> deleteAllScans() async {
    final db  = await database;
    final res = await db.rawDelete('''
      DELETE FROM Scans    
    ''');
    return res;
  }

}

