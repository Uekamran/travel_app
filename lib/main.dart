import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Travel UI',
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
       primaryColor: Color(0xff3ebace),
       accentColor: Color(0xffd8ecf1),
       scaffoldBackgroundColor: Color(0xfff3f5f7)
      ),
      home: HomeScreen(),
    );
  }
}
