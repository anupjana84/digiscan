import 'package:digiscan/screen/Splash/index.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  getData() async {
    try {
      final js = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/user'));
      var da = jsonDecode(js.body);
      print(js);
      print(da[0]['address']['zipcode']);
    } catch (e) {
      // print('WTF');
      print('WTF ${e}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.amber),
        home: const Splash()
        // initialRoute: '/',
        // routes: {
        //   // When navigating to the "/" route, build the FirstScreen widget.
        //   '/': (context) => Login(),
        //   // When navigating to the "/second" route, build the SecondScreen widget.
        //   '/second': (context) => Register(),
        // },
        );
  }
}
