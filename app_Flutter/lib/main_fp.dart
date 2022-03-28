import 'dart:html';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'dart:async';
import 'API.dart';
import 'dart:convert';

Future<Mouse> fetchPy() async {
  final response = await http
      .get(Uri.parse('http://127.0.0.1:5000/api?Query=Position%201%202'));

  if (response.statusCode == 200) {
    return Mouse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to get text');
  }
}

class Mouse {
  final String pos;
  final int mx;
  final int my;

  const Mouse({
    required this.pos,
    required this.mx,
    required this.my,
  });

  factory Mouse.fromJson(Map<String, dynamic> json) {
    return Mouse(
      pos: json['pos'],
      mx: json['mx'],
      my: json['my'],
    );
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Mouse> futureMouse;

  @override
  void initState() {
    super.initState();
    futureMouse = fetchPy();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tongue Mobile'),
        ),
        body: Center(
          child: FutureBuilder<Mouse>(
            future: futureMouse,
            builder: (context, coordinate) {
              if (coordinate.hasData) {
                return Text(coordinate.data!.pos);
              } else if (coordinate.hasError) {
                return Text('${coordinate.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
