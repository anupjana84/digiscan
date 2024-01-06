import 'package:digiscan/screen/ForgotPassword/index.dart';
import 'package:digiscan/screen/home/index.dart';
import 'package:digiscan/screen/login/widget/header.dart';
import 'package:flutter/material.dart';
import 'package:digiscan/api/index.dart';
// import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:form_field_validator/form_field_validator.dart';
import 'package:digiscan/provider/user.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();

  var email;
  var password;
  var name;
  bool show = true;
  var num = 2;
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
      print(js);
      print(da[0]['address']['zipcode']);
    } catch (e) {
      // print('WTF');
      print('WTF ${e}');
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

  login() async {
    var api = Api.baseApi;
    // print(api);
    if (!formKey.currentState!.validate()) {
      return mySnak('All Field required', context);
    } else {
      formKey.currentState!.save();
      try {
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
          body: jsonEncode(
              <String, String>{"identifier": email, "password": password}),
        );
        if (response.statusCode == 200) {
          var res = jsonDecode(response.body);
          if (res['status'] == '2') {
            mySnak('Your Account Pending', context);
          } else if (res['status'] == '3') {
            mySnak('Your Account Suspended', context);
          } else {
            print(res['email']);
            print(res['email']);
            final emailuser = res['email'];
            final userprovider =
                Provider.of<UserProvider>(context, listen: false);
            userprovider.setUserEmail(emailuser);
            // Navigator.pop(context);

            final prefs = await SharedPreferences.getInstance();
            await prefs.setString('user', jsonEncode(res));

            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Home()));
          }

          // res['status']
        } else {
          var na = jsonDecode(response.body);

          Navigator.pop(context);
          mySnak(na['error'], context);
        }
      } catch (e) {
        // Navigator.of(context).pop();
        Navigator.pop(context);
        mySnak('Somthing went wrong', context);
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
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 35.00,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "User Sign in",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.00,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20.00,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Email / Phone Number",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.00,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: TextFormField(
                          onSaved: (input) => email = input,
                          validator: MultiValidator([
                            RequiredValidator(errorText: 'Email is required'),
                            EmailValidator(
                                errorText: 'Enter a valid email address')
                          ]),
                          style: TextStyle(fontSize: 15, color: Colors.black),
                          decoration: InputDecoration(
                            errorStyle: TextStyle(
                              color: Colors
                                  .white, // Change the error text color here
                            ),
                            hintText: 'Email',
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.only(left: 20.0),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: Colors.redAccent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: Colors.greenAccent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20.00,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Login Password",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.00,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: TextFormField(
                          obscureText: show,
                          onSaved: (input) => password = input,
                          validator: RequiredValidator(
                              errorText: 'Password field required'),
                          style: TextStyle(fontSize: 15, color: Colors.black),
                          decoration: InputDecoration(
                            errorStyle: TextStyle(
                              color: Colors
                                  .white, // Change the error text color here
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  show = !show;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  show
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Color(
                                      0xff616268), // Change the color here
                                ),
                              ),
                            ),
                            hintText: 'password',
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.only(left: 20.0),
                            errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: Colors.greenAccent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 20.00,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.00,
                                  fontWeight: FontWeight.w600),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgotPassword()),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Container(
                        height: 50,
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
                              // print("object");
                              login();
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => Success()),
                              // );
                              // MySnakBar('my Sessage', context);
                            },
                            child: Text(
                              'Sing In',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 30.00,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don’t have an account!",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.00,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "  Sign up",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.00,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    // Container(
                    //   width: double.infinity,
                    //   height: 50,
                    //   margin: EdgeInsets.only(top: 15.0),
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(left: 20.0, right: 30.0),
                    //     child: DecoratedBox(
                    //         decoration: BoxDecoration(
                    //             borderRadius:
                    //                 BorderRadius.all(Radius.circular(25)),
                    //             gradient: LinearGradient(colors: [
                    //               Colors.blueAccent,
                    //               Colors.redAccent,
                    //               Colors.purpleAccent
                    //               //add more colors
                    //             ]),
                    //             boxShadow: <BoxShadow>[
                    //               BoxShadow(
                    //                   color: Color.fromRGBO(
                    //                       0, 0, 0, 0.57), //shadow for button
                    //                   blurRadius: 5) //blur radius of shadow
                    //             ]),
                    //         child: ElevatedButton(
                    //           style: ElevatedButton.styleFrom(
                    //             shape: RoundedRectangleBorder(
                    //                 borderRadius: BorderRadius.circular(25.0)),
                    //             backgroundColor: Colors.transparent,
                    //             disabledBackgroundColor: Colors.transparent,
                    //             shadowColor: Colors.transparent,
                    //             //make color or elevated button transparent
                    //           ),
                    //           onPressed: () {
                    //             onsub();
                    //           },
                    //           child: Text(
                    //             "Login",
                    //             style: TextStyle(fontSize: 22),
                    //           ),
                    //         )),
                    //   ),
                    // ),
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
