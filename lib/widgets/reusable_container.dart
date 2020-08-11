import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isiro/constants.dart';
import 'package:flutter/services.dart';



class ReusableContainer extends StatefulWidget {
  @override
  _ReusableContainerState createState() => _ReusableContainerState();
}

class _ReusableContainerState extends State<ReusableContainer> {
  String selectedCurrency = 'USD';

  DropdownButton<String> currencyResultDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
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
              Flexible(
                child: TextField(
                  keyboardType: TextInputType.numberWithOptions(),
                  inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                  style: GoogleFonts.righteous(textStyle: kCurrencyUnitPrice),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter the amount',
                  ),
                ),
              ),
              // Text('\$100',
              //     style: GoogleFonts.openSans(
              //       textStyle: kCurrencyPrice,
              //     )),
              currencyResultDropdown()
            ],
          ),
        ],
      ),
    );
  }
}



