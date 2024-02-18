import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  Future<Map<String,dynamic>>getApi ()async{
final response = await http.get(Uri.parse('https://api.coingecko.com/api/v3/exchange_rates'));
  if (response.statusCode == 200) {
    print(jsonDecode(response.body));
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
  return jsonDecode(response.body);
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child:FutureBuilder(
            future:getApi() ,//response body of api
            builder: (BuildContext context,AsyncSnapshot snapshot) {
              Map data = snapshot.data;
              List<Map> it = List<Map>.from(data['rates'].values);
              return ListView.builder(itemBuilder: (context, index) =>ListTile(title:(Text(it[index]['name'])) ,) ,itemCount:it.length ,);
            }
          ) ,
        ),
      ),
    );
  }
}
