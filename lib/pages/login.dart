import 'package:flutter/material.dart';
import 'package:sibetonapp/animation/delayed_animation.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(LoginPage());
}

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title, this.uid})
      : super(key: key); //update this to include the uid in the constructor
  final String title;
  final String uid;
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final int delayedAmount = 500;
  double _scale;
  AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: thi,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final color = Colors.white;
    _scale = 1 - _controller.value;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red[800],
        body: Center(
          child: Column(
            children: <Widget>[
              AvatarGlow(
                endRadius: 90,
                duration: Duration(seconds: 2),
                glowColor: Colors.white24,
                repeat: true,
                repeatPauseDuration: Duration(seconds: 2),
                startDelay: Duration(seconds: 1),
                child: Material(
                    elevation: 8.0,
                    shape: CircleBorder(),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[100],
                      child: FlutterLogo(
                        size: 50.0,
                      ),
                      radius: 50.0,
                    )),
              ),
              DelayedAnimation(
                child: Text(
                  "Hi There",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35.0,
                      color: color),
                ),
                delay: delayedAmount + 1000,
              ),
              DelayedAnimation(
                child: Text(
                  "I'm Reflectly",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35.0,
                      color: color),
                ),
                delay: delayedAmount + 2000,
              ),
              SizedBox(
                height: 30.0,
              ),
              DelayedAnimation(
                child: Text(
                  "Your New Personal",
                  style: TextStyle(fontSize: 20.0, color: color),
                ),
                delay: delayedAmount + 3000,
              ),
              DelayedAnimation(
                child: Text(
                  "Journaling  companion",
                  style: TextStyle(fontSize: 20.0, color: color),
                ),
                delay: delayedAmount + 3000,
              ),
              SizedBox(
                height: 100.0,
              ),
              DelayedAnimation(
                child: GestureDetector(
                  onTapDown: _onTapDown,
                  onTapUp: _onTapUp,
                  child: Transform.scale(
                    scale: _scale,
                    child: _animatedButtonUI,
                  ),
                ),
                delay: delayedAmount + 4000,
              ),
              SizedBox(
                height: 50.0,
              ),
              DelayedAnimation(
                child: Text(
                  "I Already have An Account".toUpperCase(),
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: color),
                ),
                delay: delayedAmount + 5000,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _animatedButtonUI => Container(
        height: 60,
        width: 270,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            'Hi Reflectly',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF8185E2),
            ),
          ),
        ),
      );

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }
}

//LoginPage Bawaan

//import 'package:flutter/material.dart';
//
//class LoginPage extends StatefulWidget {
//  LoginPage({Key key, this.title, this.uid}) : super(key: key); //update this to include the uid in the constructor
//  final String title;
//  final String uid;
//  @override
//  _LoginPageState createState() => _LoginPageState();
//}
//
//class _LoginPageState extends State<LoginPage> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Center(child: Text("Sudah Login"),),
//    );
//  }
//}

//LoginPage Santos Enoque Video 25

//import 'dart:html';
//
//import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:fluttertoast/fluttertoast.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:sibetonapp/main.dart';
//
//class LoginPage extends StatefulWidget {
//  @override
//  _LoginPageState createState() => _LoginPageState();
//}
//
//class _LoginPageState extends State<LoginPage> {
//  final GoogleSignIn googleSignIn = new GoogleSignIn();
//  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//  SharedPreferences preferences;
//  bool loading = false;
//  bool isLogedin = false;
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    isSignedIn();
//  }
//
//  void isSignedIn() async {
//    setState(() {
//      loading = true;
//    });
//
//    preferences = await SharedPreferences.getInstance();
//    isLogedin = await googleSignIn.isSignedIn();
//
//    if (isLogedin) {
//      Navigator.pushReplacement(
//          context, MaterialPageRoute(builder: (context) => MyApp()));
//    }
//
//    setState(() {
//      loading = false;
//    });
//  }
//
//  Future handleSignIn() async {
//    preferences = await SharedPreferences.getInstance();
//
//    setState(() {
//      loading = true;
//    });
//    GoogleSignInAccount googleUser = await googleSignIn.signIn();
//    GoogleSignInAuthentication googleSignInAuthentication =
//        await googleUser.authentication;
//    FirebaseUser firebaseUser = await firebaseAuth.signInWithGoogle(
//        idToken: googleSignInAuthentication.idToken,
//        accessToken: googleSignInAuthentication.accessToken);
//
//    if (firebaseUser != null) {
//      final QuerySnapshot result = await Firestore.instance
//          .collection("users")
//          .where("id", isEqualTo: firebaseUser.uid)
//          .getDocuments();
//      final List<DocumentSnapshot> documents = result.documents;
//      if (documents.length == 0) {
//        Firestore.instance
//            .collection("users")
//            .document(firebaseUser.uid)
//            .setData({
//          "id": firebaseUser.uid,
//          "username": firebaseUser.displayName,
//          "profilePicture": firebaseUser.photoUrl
//        });
//        await preferences.setString("id", firebaseUser.uid);
//        await preferences.setString("username", firebaseUser.displayName);
//        await preferences.setString("photoUrl", firebaseUser.photoUrl);
//      } else {
//        await preferences.setString("id", documents[0]['id']);
//        await preferences.setString("username", documents[0]['username']);
//        await preferences.setString("photoUrl", documents[0]['photoUrl']);
//      }
//
//      Fluttertoast.showToast(msg: "Login was successful");
//      setState(() {
//        loading = false;
//      });
//    } else {}
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Colors.white,
//        centerTitle: true,
//        title: new Text("Login"),
//        elevation: 0.5,
//      ),
//      body: Stack(
//        children: <Widget>[
//          Center(
//            child: FlatButton(
//                onPressed: () {
//                  handleSignIn();
//                },
//                child: Text("Sign in / Sign up with google")),
//          ),
//          Visibility(
//              visible: loading ?? true,
//              child: Container(
//                color: Colors.white.withOpacity(0.7),
//                child: CircularProgressIndicator(
//                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red[800]),
//                ),
//              ))
//        ],
//      ),
//    );
//  }
//}
