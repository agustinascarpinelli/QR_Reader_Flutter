import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/widgets/widgets.dart';

import '../providers/scans_provider.dart';

class DirectionsScreen extends StatelessWidget {
   
  const DirectionsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

      
     return ScansList(type: 'http');
  }
}