//Snippet mateapp
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/providers.dart';
import 'package:qr_reader/screens/screens.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
         ChangeNotifierProvider(create: (_)=>new UiProvider()),
         ChangeNotifierProvider(create: (_)=>new ScansProvider())
     

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title:'Qr Scanner',
        initialRoute: 'home',
        routes: {
          'home':(_)=>HomeScreen(),
           'maps':(_)=>MapsScreen(),
          // 'maps-history':(_)=>MapsHistoryScreen()
        },
       theme: ThemeData.dark().copyWith(
        floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.deepPurple),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(selectedItemColor: Colors.deepPurple)
       )
        
      ),
    );
  }
}