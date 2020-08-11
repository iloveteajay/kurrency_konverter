import 'package:flutter/material.dart';
import 'screens/currency_screen.dart';
import './screens/splashscreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          accentColor: Color(0xFF19B563),
          iconTheme: IconThemeData(color: Color(0xFF19B563))),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        CurrencyScreen.id: (context) => CurrencyScreen()
      },
    );
  }
}


