import 'package:digiscan/provider/category.dart';
import 'package:digiscan/provider/user.dart';
import 'package:digiscan/screen/Splash/index.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MyApp(),
  );
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

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
            create: (context) => UserProvider()),
        ChangeNotifierProvider<CategoryProvider>(
            create: (context) => CategoryProvider()),
      ],
      child: MaterialApp(
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
          ),
    );
  }
}
