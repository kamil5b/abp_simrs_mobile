
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Network{
  final String _url = 'http://192.168.1.8:8000/api';
  // 192.168.1.8:8000 is my IP, change with your IP address
  var token;

  _getToken() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = jsonDecode(localStorage.getString('token')!)['token'];
  }

  post(data, apiURL) async{
    print("POST");
    var fullUrl = _url + apiURL;
    return await http.post(
        Uri.parse(fullUrl),
        body: jsonEncode(data),
        headers: _setHeaders()
    );
  }


  editData(data, apiURL) async{
    print("AUTH");
    var fullUrl = _url + apiURL;
    return await http.put(
        Uri.parse(fullUrl),
        body: jsonEncode(data),
        headers: _setHeaders()
    );
  }

  deleteData(apiURL) async{
    var fullUrl = _url + apiURL;
    await _getToken();
    return await http.delete(
      Uri.parse(fullUrl),
      headers: _setHeaders(),
    );
  }

  getData(apiURL) async{
    var fullUrl = _url + apiURL;
    await _getToken();
    print("GET DATA");
    var data = await http.get(
      Uri.parse(fullUrl),
      headers: _setHeaders(),
    );
    print(data.body);
    return data;
  }

  _setHeaders() => {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  };
}