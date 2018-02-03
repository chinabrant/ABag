import 'dart:convert';
import 'dart:io';
import 'dart:async';

class BaseApi {
  static const String kLeancloudId = 'SPM9bUpyxtGUdbrLMbl9IMMM-gzGzoHsz';
  static const String kLeancloudKey = 'HMK6nVDGaKU2m7sJAgHq65hN';
  static const String kBaseUrl = 'SPM9bUpy.api.lncld.net';

  static Future<Map> get() async {

    try {
      var httpClient = new HttpClient();
      var uri = new Uri.https(kBaseUrl, '/1.1/classes/Strategy', {'include' : 'user'});
      print('$uri');
      var request = await httpClient.getUrl(uri);
      request.headers.set("Content-Type", "application/json");
      request.headers.set('X-LC-Id', kLeancloudId);
      request.headers.set('X-LC-Key', kLeancloudKey);
      var response = await request.close();

      if (response.statusCode == HttpStatus.OK) {
        var responseBody = await response.transform(UTF8.decoder).join();
        var data = JSON.decode(responseBody);
        return data;

      } else {
        print('error');
      }
    } catch (exception) {
      print('$exception');
    }

  }
}