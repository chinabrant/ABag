import 'dart:convert';
import 'dart:io';

class StrategyApi {


  get() async {

    try {
      var httpClient = new HttpClient();
      var uri = new Uri.https("SPM9bUpy.api.lncld.net", '/1.1/classes/Strategy', {});
      print('$uri');
      var request = await httpClient.getUrl(uri);
      request.headers.set("Content-Type", "application/json");
      request.headers.set('X-LC-Id', 'SPM9bUpyxtGUdbrLMbl9IMMM-gzGzoHsz');
      request.headers.set('X-LC-Key', 'HMK6nVDGaKU2m7sJAgHq65hN');
      var response = await request.close();

      if (response.statusCode == HttpStatus.OK) {
        var responseBody = await response.transform(UTF8.decoder).join();
        var data = JSON.decode(responseBody);
//        print(data['results'][0]['desc']);

        List arr = data['results'];
        for (var i = 0; i < arr.length; i++) {
          var obj = arr[i];
          print(obj['desc']);
        }

      } else {
        print('error');
      }
    } catch (exception) {
      print('$exception');
    }




  }
}