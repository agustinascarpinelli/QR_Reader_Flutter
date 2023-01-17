import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/db_provider.dart';
import 'package:qr_reader/providers/providers.dart';
import 'package:qr_reader/screens/screens.dart';
import 'package:qr_reader/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('History'),
        actions: [
          IconButton(
            onPressed:(){
              final scansProvider=Provider.of<ScansProvider>(context,listen: false);
               scansProvider.deleteAllScans();
              
            },
             icon: Icon (Icons.delete_forever))
        ],
      ),
      body: _homeBody(),
      bottomNavigationBar: CustomNavigatorBar(),
      floatingActionButton:ScanButton() ,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _homeBody extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final uiProvider=Provider.of<UiProvider>(context);
    final currentIndex=uiProvider.selectedMenuOpt;

    
final scansProvider=Provider.of<ScansProvider>(context,listen: false);

    switch(currentIndex){
      case 0:
      scansProvider.uploadScansByType('geo');
      return MapsHistoryScreen();
     
      case 1:
        scansProvider.uploadScansByType('http');
      return DirectionsScreen();


      
      default:
      return MapsScreen();
    }
  }
}