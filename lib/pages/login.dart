import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sibetonapp/pages/homepage.dart';

//Button
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

//FireBase
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//Shared preferences & Flutter Toast
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  bool isLoading = false;
  bool isLoggedIn = false;

  SharedPreferences prefs;
  FirebaseUser currentUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSignIn();
  }

  void isSignIn() async {
    setState(() {
      isLoading = true;
    });
    prefs = await SharedPreferences.getInstance();

    isLoggedIn = await _googleSignIn.isSignedIn();
    if (isLoading) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    }
    setState(() {
      isLoading = false;
    });
  }

  Future<Null> handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
    final FirebaseUser firebaseUser =
        (await firebaseAuth.signInWithCredential(credential)).user;

    if (firebaseUser != null) {
      final QuerySnapshot result = await Firestore.instance
          .collection('user')
          .where('id', isEqualTo: firebaseUser.uid)
          .getDocuments();

      List<DocumentSnapshot> documents = result.documents;
      if (documents.length == 0) {
        Firestore.instance
            .collection('user')
            .document(firebaseUser.uid)
            .setData({
          'id': firebaseUser.uid,
          'username': firebaseUser.displayName,
          'photoUrl': firebaseUser.photoUrl
        });

        //Data to Local
        currentUser = firebaseUser;
        await prefs.setString('id', currentUser.uid);
        await prefs.setString('username', currentUser.displayName);
        await prefs.setString('PhotoUrl', currentUser.photoUrl);
      } else {
        await prefs.setString('id', documents[0]['id']);
        await prefs.setString('username', documents[0]['username']);
        await prefs.setString('PhotoUrl', documents[0]['photoUrl']);
      }
      Fluttertoast.showToast(msg: "Sign In Sucess");
      Navigator.push(context, MaterialPageRoute(builder: (context)=> MyHomePage()));
    } else {
      Fluttertoast.showToast(msg: "Sign in Fail");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: GoogleSignInButton(
              onPressed: handleSignIn,
            ),
          ),
          Positioned(
            child: Center(
              child: isLoading
                  ? Container(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                      ),
                      color: Colors.white.withOpacity(0.8),
                    )
                  : Container(),
            ),
          ),
        ],
      ),
    );
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
