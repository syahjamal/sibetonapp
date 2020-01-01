import 'package:flutter/services.dart';
import 'package:sibetonapp/pages/homepage.dart';
import 'package:sibetonapp/pages/login.dart';
import 'package:flutter/material.dart';

import 'pages/opening.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Colors.red.shade900),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return _buildRoute(settings, new OpeningPage());
          case '/login':
            return _buildRoute(settings, new LoginPage());
          case '/myapp':
            return _buildRoute(settings, new MyHomePage());
          default:
            return null;
        }
      },
    );
  }
}

MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
  return new MaterialPageRoute(
    settings: settings,
    builder: (BuildContext context) => builder,
  );
}



// saya buat class baru

//class Register extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'testing',
//      home:  RegisterPage(),
//      routes: <String, WidgetBuilder>{
//        '/loginpage': (BuildContext context) => LoginPage(),
//      },
//    );
//  }
//}
