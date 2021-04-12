import 'dart:convert';

import 'package:http/http.dart' as http;

const apikey = 'BC929D53-6E80-4515-8A27-B65C52642092';

class CoinAPI{
  Future<double> getExchangePrice(String cryptoCurrency, String currency) async {
    http.Response response = await http.get(Uri.parse('https://rest.coinapi.io/v1/exchangerate/BTC/$currency?apikey=$apikey'));

    if (response.statusCode == 200) {
      String data = response.body;
      print(jsonDecode(data)['rate']);
      return jsonDecode(data)['rate'];
      // return jsonDecode(data);
    } else{
      print(response.statusCode);
      return 1.0001;
    }
  }
}
