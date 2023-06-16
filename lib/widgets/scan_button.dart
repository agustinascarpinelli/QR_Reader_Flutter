import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/providers.dart';
import 'package:qr_reader/utils/utils.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child:const Icon(Icons.filter_center_focus),
      onPressed:()async{
         //String barcodeScanRes= await FlutterBarcodeScanner.scanBarcode('#36013F','Cancel',false,ScanMode.QR);

        
         String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#3D8BEF', 'Cancelar', false, ScanMode.QR );
        if(barcodeScanRes==-1){
          //significa que el usuario cancelo
          return;
        }
        
        final scanProvider=Provider.of<ScansProvider>(context,listen: false);
       final newScan=await scanProvider.newScan(barcodeScanRes);
       launchUrl(context, newScan);
        
  });
  }
}