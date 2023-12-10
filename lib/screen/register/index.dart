import 'package:flutter/material.dart';
import 'package:digiscan/api/index.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var name = true;
  @override
  void initState() {
    // gotoRoute();
    super.initState();
  }

  gotoRoute() {
    if (name) {
      // Navigator.pushNamed(context, '/second');
    }
  }

  mySnak(message, context) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  createAlbum() async {
    var api = Api.baseApi + '/api/v1/registe';

    try {
      final response = await http.post(
        Uri.parse(api),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "name": "test222",
          "email": "tes222@gmail.com",
          "password": "123456"
        }),
      );
      if (response.statusCode == 201) {
        var na = jsonDecode(response.body);

        // print(na['message']);
        // print("na");
      } else {
        // If the server did not return a 201 CREATED response,
        // then throw an exception.
        // throw Exception('Failed to create album.');
        var na = jsonDecode(response.body);
        mySnak('ys', context);
      }
    } catch (e) {
      mySnak('yes', context);
    }

    // if (response.statusCode == 201) {
    //   // If the server did return a 201 CREATED response,
    //   // then parse the JSON.
    // } else {
    //   // If the server did not return a 201 CREATED response,
    //   // then throw an exception.
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: Center(
        child: ListView(
          children: [
            TextButton(
                onPressed: () {
                  createAlbum();
                },
                child: Text('eter'))
          ],
        ),
      ),
    );
  }
}
