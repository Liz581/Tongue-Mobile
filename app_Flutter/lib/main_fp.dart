import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// import 'dart:async';
// import 'API.dart';
// import 'dart:html';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String gett = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tongue Mobile'),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(gett),
              Center(
                child: Container(
                  width: 150,
                  height: 60,
                  child: FlatButton(
                    color: Colors.blue,
                    onPressed: () async {
                      final response = await http
                          .get(Uri.parse('http://127.0.0.1:5000/flut'));
                      final decoded =
                          json.decode(response.body) as Map<String, dynamic>;
                      setState(() {
                        gett = decoded['gett'];
                      });
                    },
                    child: Text(
                      'Press',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
