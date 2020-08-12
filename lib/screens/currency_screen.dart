import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/reusable_container.dart';
import '../widgets/reusable_container2.dart';
import '../constants.dart';

//import 'package:provider/provider.dart';

class CurrencyScreen extends StatefulWidget {
  static String id = 'calc_screen';

  final List<String> newCurrencyList;
  CurrencyScreen({this.newCurrencyList});

  @override
  _CurrencyScreenState createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  @override
  Widget build(BuildContext context) {
    final currencyList = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Currency Converter',
              style: GoogleFonts.righteous(textStyle: kAppBarStyle)),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: kContainerColor,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: ReusableContainer(newCurrencyList: currencyList),
                ),
              ),
              SizedBox(height: 5.0),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: kContainerColor,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: ReusableContainer2(newCurrencyList: currencyList),
                ),
              ),
            ],
          ),
        ));
  }
}
