import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';

class CustomNavigatorBar extends StatelessWidget {
  const CustomNavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {
     final uiProvider=Provider.of<UiProvider>(context);
    final currentIndex=uiProvider.selectedMenuOpt;
    
    return BottomNavigationBar(
      onTap: (int i)=>uiProvider.selectedMenuOpt=i,
      elevation: 0,
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Map'
          ),
             BottomNavigationBarItem(
          icon: Icon(Icons.compass_calibration),
          label: 'Directions'
          )
      ]
      
      );
  }
}