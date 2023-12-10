import 'package:digiscan/screen/home/index.dart';
import 'package:digiscan/screen/login/widget/header.dart';
import 'package:flutter/material.dart';
import 'package:digiscan/api/index.dart';
// import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Success extends StatefulWidget {
  const Success({super.key});

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  final formKey = GlobalKey<FormState>();

  var email;
  var password;
  var name;
  var textt = '''Your password has been reset successfully To access your 
dashboard, simply click on the login button below. We're 
excited to welcome you back and support you on your journey 
to success. If you have any questions or need assistance, feel 
free to reach out. Happy exploring!''';
  @override
  void initState() {
    super.initState();
  }

  getData() async {
    try {
      //https://2dcd-103-155-54-197.ngrok.io
      final js =
          await http.get(Uri.parse('https://2dcd-103-155-54-197.ngrok.io'));
      var da = jsonDecode(js.body);

      print(da[0]['address']['zipcode']);
    } catch (e) {
      // print('WTF');
      // print('WTF ${e}');
    }
  }

  gotoSecond() {
    // Navigate to the second screen using a named route.
    Navigator.pushNamed(context, '/second');
  }

  // Future satvedat() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   var data = jsonEncode(<String, String>{
  //     "name": "anup",
  //     "email": "anup@gmail.com",
  //     "id": "64fae59fc9eea1c162cea2c3",
  //     "token":
  //         "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NGZhZTU5ZmM5ZWVhMWMxNjJjZWEyYzMiLCJuYW1lIjoiYW51cCIsImVtYWlsIjoiYW51cEBnbWFpbC5jb20iLCJpc0FjdGl2ZSI6ImFjdGl2ZSIsImlzT25saW5lIjoib2ZmbGluZSIsImNyZWF0ZWRBdCI6IjIwMjMtMDktMDhUMDk6MTM6MDMuMTk5WiIsInVwZGF0ZWRBdCI6IjIwMjMtMTAtMDNUMTk6MjY6MjIuNTE0WiIsIl9fdiI6MCwiaWF0IjoxNjk4OTQ1MjkwLCJleHAiOjE2OTg5NTI0OTB9.7AbPMxw3mZitWzSJhysr9vpsDTfHdzlXpmpPGHVJnSE",
  //     "message": "Login Successful"
  //   });

  //   await prefs.setString('user', data);
  // }

  // Future getDataa() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   var dta = await prefs.getString('user');
  //   var fin = jsonDecode(dta.toString());
  // }

  mySnak(message, context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.red[600],
    ));
  }

  createAlbum() async {
    var api = Api.baseApi + '/api/v1/register';

    if (!formKey.currentState!.validate()) {
      return mySnak('All Field required', context);
    } else {
      formKey.currentState!.save();
      try {
        print(email);
        print(password);
        print(name);
        showDialog(
            context: context,
            builder: (context) {
              return Center(child: CircularProgressIndicator());
            });

        final response = await http.post(
          Uri.parse(api),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            "name": name,
            "email": email,
            "password": password
          }),
        );
        if (response.statusCode == 201) {
          var na = jsonDecode(response.body);
          // Navigator.of(context).pop();
          Navigator.pop(context);
          mySnak(na['message'], context);
          formKey.currentState!.reset();
          print(na['message']);
          print("na");
        } else {
          // If the server did not return a 201 CREATED response,
          // then throw an exception.
          // throw Exception('Failed to create album.');
          var na = jsonDecode(response.body);
          // Navigator.of(context).pop();
          Navigator.pop(context);
          mySnak(na['error'], context);
          print(na['error']);
          print("error");
        }
      } catch (e) {
        // Navigator.of(context).pop();
        Navigator.pop(context);
        mySnak('Somthing went wrong', context);
        print('${e} name');
        print("e");
      }
    }
    // if (response.statusCode == 201) {
    //   // If the server did return a 201 CREATED response,
    //   // then parse the JSON.
    // } else {
    //   // If the server did not return a 201 CREATED response,
    //   // then throw an exception.
    // }
  }

  // showError(String errorMessage) {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text('Error'),
  //           content: Text("errorMessage"),
  //           actions: <Widget>[
  //             TextButton(
  //               child: Text('OK'),
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //             )
  //           ],
  //         );
  //       });
  // }

  onsub() {
    mySnak("Thank You", context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(246, 174, 48, 1),
      body: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: FractionalOffset(0.5, 0),
            end: FractionalOffset(0.5, 1.0),
            colors: [
              Color(0xffFFFFFF),
              Color(0xffB892E3),
              Color(0xff6E3E82),
              Color(0xff9D78C7),
              Color(0xff58246D),
            ],
          ),
        ),
        child: ListView(
          children: [
            Header(),
            Container(
              height: 100,
            ),
            Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Congratulations!',
                      style: TextStyle(
                          fontSize: 32.00,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10.00,
                    ),
                    Text(
                      textt,
                      style: TextStyle(
                          fontSize: 10.00,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 20.00,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Container(
                        height: 45,
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 15),
                        decoration: BoxDecoration(
                            color: Color(0xffDFA12B),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(35.0)),
                              backgroundColor: Colors.transparent,
                              disabledBackgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              side: BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Home()),
                              );
                              // print("object");
                              // createAlbum();
                              // MySnakBar('my Sessage', context);
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

// Future<void> _dialogBuilder(BuildContext context) {
//   return showDialog<void>(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: const Text('Basic dialog title'),
//         content: const Text(
//           'A dialog is a type of modal window that\n'
//           'appears in front of app content to\n'
//           'provide critical information, or prompt\n'
//           'for a decision to be made.',
//         ),
//         actions: <Widget>[
//           TextButton(
//             style: TextButton.styleFrom(
//               textStyle: Theme.of(context).textTheme.labelLarge,
//             ),
//             child: const Text('Disable'),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//           TextButton(
//             style: TextButton.styleFrom(
//               textStyle: Theme.of(context).textTheme.labelLarge,
//             ),
//             child: const Text('Enable'),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       );
//     },
//   );
// }
