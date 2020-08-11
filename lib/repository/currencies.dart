import 'dart:convert';
import 'package:http/http.dart' as http;
//import 'package:provider/provider.dart';
//import 'package:flutter/foundation.dart';

const apiURL = 'http://data.fixer.io/api/latest?access_key=$apiKey';
const apiKey = '3e8bf4bd1f1fe57727b2c12f988825c8';

class CurrencyData {
  Future<List<String>> getCurrencyData() async {
    http.Response response = await http.get(apiURL);
    if (response.statusCode == 200) {
      //if the server returns a 200 OK response then parse the JSON
      var decodedData = jsonDecode(response.body);

      Map<String, dynamic> rates = decodedData['rates'];
      
      //converting the map key that holds the currencies to list
      var currencyList = rates.keys.toList(); 

      return currencyList; 
    } else {
      //If the serve didn't return a 200 OK response, then throw an exception.
      print(response.statusCode);
      throw Exception('Problem with the get request');
    }
  }
}
