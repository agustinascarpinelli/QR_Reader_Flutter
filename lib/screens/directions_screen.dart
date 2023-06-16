import 'package:flutter/material.dart';
import 'package:qr_reader/widgets/widgets.dart';


class DirectionsScreen extends StatelessWidget {
   
  const DirectionsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

      
     return const ScansList(type: 'http');
  }
}