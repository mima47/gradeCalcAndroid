import 'dart:convert';
import 'package:http/http.dart' as http;

String accessToken;

Future<String> getToken({String user,String pass,String instCode}) async {

  String url = "https://$instCode.e-kreta.hu/idp/api/v1/Token";
  Map<String, String> headers = {
    "Content-type":"application/x-www-form-urlencoded",
    "Accept":"application/json",
    "User-Agent":"Kreta.Ellenorzo/2.9.8.2020012301 (Android; SM-G960F 0.0)"
  };
  String data = 'password=$pass&institute_code=$instCode&grant_type=password&client_id=919e0c1c-76a2-4646-a2fb-7085bbbf3c56&userName=$user';

  http.Response response = await http.post(url,headers: headers,body: data);

  String body = response.body;
  final Map parsed = json.decode(body);
  accessToken = parsed['access_token'];
  return accessToken;
}

getEvals(token, instCode) async {

  String url = 'https://$instCode.e-kreta.hu/mapi/api/v1/StudentAmi';
  Map<String, String> headers = {
    'Authorization': 'Bearer $token',
    'Content-Type': 'application/x-www-form-urlencoded',
    'Accept': 'application/json',
    'User-Agent': 'Kreta.Ellenorzo/2.9.8.2020012301 (Android; SM-G960F 0.0)'
  };

  http.Response response = await http.get(url,headers: headers);
  final Map parsed = json.decode(response.body);
  return parsed['Evaluations'];
}