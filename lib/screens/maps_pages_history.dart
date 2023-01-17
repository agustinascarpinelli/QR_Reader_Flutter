import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/providers.dart';
import 'package:qr_reader/widgets/widgets.dart';

class MapsHistoryScreen extends StatelessWidget {
   
  const MapsHistoryScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    

   
  return ScansList(type:'geo');
  }
}