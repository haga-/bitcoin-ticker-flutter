import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const String bitcoinUrl =
    'https://apiv2.bitcoinaverage.com/indices/global/ticker/BTCUSD';

class CoinData {
  Future<double> getCoinData() async {
    http.Response response = await http.get(bitcoinUrl);

    var decodedData;

    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }

    return decodedData['last'];
  }
}
