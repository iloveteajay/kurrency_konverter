import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../screens/currency_screen.dart';
import '../repository/currencies.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'splash_screen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 6),
      vsync: this,
    );

    //animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);

    controller.forward();
    controller.addListener(() {
      setState(() {});
    });

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        getCurrencyList();
      }
    });
  }

  getCurrencyList() async {
    var currencyData = await CurrencyData().getCurrencyData();
    List<String> currencyList = currencyData;

    Navigator.pushReplacementNamed(context, CurrencyScreen.id,
        arguments: currencyList);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black54,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Image.asset('assets/calc.png'),
                    height: 200.0,
                    width: 100,
                  ),
                  SizedBox(
                    width: controller.value * 250,
                    child: TextLiquidFill(
                      text: 'Kurrency Konverter'.toUpperCase(),
                      waveColor: Colors.green,
                      textStyle: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                      ),
                      boxHeight: 100.0,
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
