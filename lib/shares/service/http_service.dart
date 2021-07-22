import 'dart:convert';
import 'package:sale_management/shares/environment/environment.dart';
import 'package:http/http.dart' as http;
import 'package:sale_management/shares/model/key/authorization_key.dart';
import 'package:sale_management/shares/statics/authorization_static.dart';

class HttpService {

  static Future<Map<String, dynamic>> httpPost({required String endPoint, required Map<String, dynamic> json} ) async {
    String uri = Environment.url + endPoint;
    var url = Uri.parse(uri);
    print(AuthorizationStatic.tokenObject);
    print(AuthorizationStatic.tokenObject[AuthorizationKey.accessToken]);
    var response = await http.post(
      url,
      body: jsonEncode(json),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization' : 'Bearer '+AuthorizationStatic.tokenObject[AuthorizationKey.accessToken],
      },
    );

    if (response.body != '') {
      Map<String, dynamic> responseData = jsonDecode(response.body);
      return Future.value(responseData['body']);
      print('json data response : '+responseData.toString());
    } else {

    }
    return Future.value({});
  }

}