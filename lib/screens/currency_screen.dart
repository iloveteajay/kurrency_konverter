import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/reusable_container.dart';
import '../widgets/reusable_container2.dart';
import '../constants.dart';
import '../repository/currencies.dart';
//import 'package:provider/provider.dart';

class CurrencyScreen extends StatefulWidget {
  static String id = 'calc_screen';

  @override
  _CurrencyScreenState createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  @override
  void initState() {
    getCurrencyList();
    super.initState();
  }

  getCurrencyList() async {
    var currencyData = await CurrencyData().getCurrencyData();
    List<String> currencyList = currencyData;
    //print(currencyList);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ReusableContainer2(newCurrencyList: currencyList); //passing the currency list over to container2
    }));
  }

  @override
  Widget build(BuildContext context) {
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
                  child: ReusableContainer(),
                ),
              ),
              SizedBox(height: 5.0),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: kContainerColor,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: ReusableContainer2(),
                ),
              ),
            ],
          ),
        ));
  }
}
