import 'package:bitcoin_converter/coinApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  double BTCConvertedPrice;
  double LTCConvertedPrice;
  double ETHConvertedPrice;


  Future<void> getPrice() async {
    CoinAPI coinAPI = CoinAPI();
    BTCConvertedPrice = await coinAPI.getExchangePrice('BTC', selectedCurrency);
    LTCConvertedPrice = await coinAPI.getExchangePrice('LTC', selectedCurrency);
    ETHConvertedPrice = await coinAPI.getExchangePrice('ETH', selectedCurrency);
  }

  CupertinoPicker getCupertinoPicker() {
    List<Text> pickerItems = [];
    for(String currency in currenciesList){
      pickerItems.add(
        Text(
          currency,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
          getPrice();
        });
      },
      children: pickerItems,
    );
  }

  DropdownButton<String> getDropdownButton() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for(String currency in currenciesList){
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value){
        setState(() {
          selectedCurrency = value;
          getPrice();
        });
       },
     );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(
              children: [
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      // '1 BTC = ${BTCConvertedPrice.toStringAsFixed(2)} $selectedCurrency',

                      '1 BTC = $BTCConvertedPrice $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      // '1 ETH = ${ETHConvertedPrice.toStringAsFixed(2)} $selectedCurrency',
                      '1 ETH = $ETHConvertedPrice $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      // '1 LTC = ${LTCConvertedPrice.toStringAsFixed(2)} $selectedCurrency',
                      '1 LTC = $LTCConvertedPrice $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isAndroid ? getDropdownButton() : getCupertinoPicker(),
          ),
        ],
      ),
    );
  }
}


