import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:sale_management/shares/database_sqflite/authorization_sqflite.dart';
import 'package:sale_management/shares/environment/environment.dart';
import 'package:sale_management/shares/model/key/authorization_key.dart';

class AuthorizationService {

    static Future<Map<String, dynamic>> authorization({required String userName, required String password}) async {
      String clientName = 'spring-security-oauth2-read-write-client';
      String clientPassword = 'spring-security-oauth2-read-write-client-password1234';

      String basicAuth = 'Basic ' +
          base64Encode(utf8.encode('$clientName:$clientPassword'));
      String uri = Environment.url + "/oauth/token";
      var url = Uri.parse(uri);
      var response = await http.post(
        url,
        body: {
          'client_id': 'spring-security-oauth2-read-write-client',
          'grant_type': 'password',
          'username': userName,
          'password': password
        },
        headers: {
          HttpHeaders.authorizationHeader: basicAuth,
        },
      );

      if (response.body != '') {
        Map<String, dynamic> tokenResponse = jsonDecode(response.body);
        Map<String, dynamic> json = {
            AuthorizationKey.id: 1,
            AuthorizationKey.accessToken: tokenResponse['access_token'],
            AuthorizationKey.refreshToken: tokenResponse['refresh_token'],
            AuthorizationKey.expiresIn: tokenResponse['expires_in'],
            AuthorizationKey.scope: tokenResponse['access_token'],
            AuthorizationKey.tokenType: tokenResponse['token_type']
          };
        Map<String, dynamic> getTokenStore = await AuthorizationDataBase.getObjectById(1);

        if (getTokenStore.toString() == '{}') {
          int created = await AuthorizationDataBase.create(json);
          if(created > 0) {
            return Future.value(tokenResponse);
          }
        } else {
          int updated = await AuthorizationDataBase.update(json);
          if(updated > 0) {
            return Future.value(tokenResponse);
          }
        }

      }
      return Future.value({});
    }
}