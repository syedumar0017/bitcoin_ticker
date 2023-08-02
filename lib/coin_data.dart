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
const bitcoinAverageURL =
    'https://apiv2.bitcoinaverage.com/indices/global/ticker';

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '75FBB5C2-E04E-4126-9C82-A48DAF8D37BE';

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    var requesturl1 =
        Uri.parse('$coinAPIURL/BTC/$selectedCurrency?apikey=$apiKey');
    var requesturl2 =
        Uri.parse('$coinAPIURL/ETH/$selectedCurrency?apikey=$apiKey');
    var requesturl3 =
        Uri.parse('$coinAPIURL/LTC/$selectedCurrency?apikey=$apiKey');
    http.Response response1 = await http.get(requesturl1);
    http.Response response2 = await http.get(requesturl2);
    http.Response response3 = await http.get(requesturl3);

    if (response1.statusCode == 200) {
      var decodedData1 = jsonDecode(response1.body);
      num lastPrice1 = decodedData1['rate'];

      var decodedData2 = jsonDecode(response2.body);
      num lastPrice2 = decodedData2['rate'];

      var decodedData3 = jsonDecode(response3.body);
      num lastPrice3 = decodedData3['rate'];
      final Map<String, String> newMap = {
        'BTC': lastPrice1.toStringAsFixed(0),
        'ETH': lastPrice2.toStringAsFixed(0),
        'LTC': lastPrice3.toStringAsFixed(0)
      };
      print(lastPrice1);
      print(lastPrice2);
      print(lastPrice3);

      return newMap;
    } else {
      print(response1.statusCode);
    }
  }
}
