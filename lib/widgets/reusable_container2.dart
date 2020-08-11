import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isiro/constants.dart';
//import 'package:provider/provider.dart';
//import '../repository/currencies.dart';

class ReusableContainer2 extends StatefulWidget {
  final List<String> newCurrencyList;

  ReusableContainer2({this.newCurrencyList});

  @override
  ReusableContainer2State createState() => ReusableContainer2State();
}

class ReusableContainer2State extends State<ReusableContainer2> {
  String selectedCurrency = 'EUR';

  DropdownButton<String> currencyResultDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in widget.newCurrencyList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      //print(currency);
      dropdownItems.add(newItem);
    }
    return DropdownButton(
        elevation: 0,
        value: selectedCurrency,
        style: GoogleFonts.righteous(textStyle: kAppBarStyle),
        items: dropdownItems,
        onChanged: (value) {
          setState(() {
            selectedCurrency = value;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.0,
        right: 20.0,
        left: 20.0,
        bottom: 40.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("$selectedCurrency, \$1 = €0.903",
              style: GoogleFonts.openSans(
                textStyle: kCurrencyUnitPrice,
              )),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('\$100',
                  style: GoogleFonts.openSans(
                    textStyle: kCurrencyPrice,
                  )),
              currencyResultDropdown() //dropdownbutton
            ],
          ),
        ],
      ),
    );
  }
}
