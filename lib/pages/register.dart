import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../db/users.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  UserServices _userServices = UserServices();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  String gender;

  bool hidePass = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 3;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          Image.asset(
            'images/background.jpg',
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
//          TODO:: Make the logo show

          Container(
            color: Colors.black.withOpacity(0.4),
            width: double.infinity,
            height: double.infinity,
          ),

          Container(
            alignment: Alignment.topCenter,
            child: Image.asset(
              'images/Sibeton-logo.png',
              width: 280.0,
              height: 240.0,
            ),
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: Center(
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white.withOpacity(0.8),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: TextFormField(
                                controller: _nameTextController,
                                decoration: InputDecoration(
                                    hintText: "Full name",
                                    icon: Icon(Icons.person_outline),
                                    border: InputBorder.none),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "The name field cannot be empty";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white.withOpacity(0.8),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: TextFormField(
                                controller: _emailTextController,
                                decoration: InputDecoration(
                                    hintText: "Email",
                                    icon: Icon(Icons.alternate_email),
                                    border: InputBorder.none),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    Pattern pattern =
                                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                    RegExp regex = new RegExp(pattern);
                                    if (!regex.hasMatch(value))
                                      return 'Please make sure your email address is valid';
                                    else
                                      return null;
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white.withOpacity(0.8),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: ListTile(
                                title: TextFormField(
                                  controller: _passwordTextController,
                                  obscureText: hidePass,
                                  decoration: InputDecoration(
                                      hintText: "Password",
                                      icon: Icon(Icons.lock_outline),
                                      border: InputBorder.none),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "The password field cannot be empty";
                                    } else if (value.length < 6) {
                                      return "The password has to be at least 6 characters long";
                                    }
                                    return null;
                                  },
                                ),
                                trailing: IconButton(
                                    icon: Icon(Icons.remove_red_eye),
                                    onPressed: () {
                                      setState(() {
                                        hidePass = false;
                                      });
                                    }),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white.withOpacity(0.8),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: ListTile(
                                title: TextFormField(
                                  controller: _confirmPasswordController,
                                  obscureText: hidePass,
                                  decoration: InputDecoration(
                                      hintText: "Confirm password",
                                      icon: Icon(Icons.lock_outline),
                                      border: InputBorder.none),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "The password field cannot be empty";
                                    } else if (value.length < 6) {
                                      return "The password has to be at least 6 characters long";
                                    } else if (_passwordTextController.text !=
                                        value) {
                                      return "The passwords do not match";
                                    }
                                    return null;
                                  },
                                ),
                                trailing: IconButton(
                                    icon: Icon(Icons.remove_red_eye),
                                    onPressed: () {
                                      setState(() {
                                        hidePass = false;
                                      });
                                    }),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.red.shade700,
                              elevation: 0.0,
                              child: MaterialButton(
                                onPressed: () {
                                  validateForm();
                                },
                                minWidth: MediaQuery.of(context).size.width,
                                child: Text(
                                  "Sign Up",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                              )),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Login",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.blue),
                                ))),
                      ],
                    )),
              ),
            ),
          ),

          Visibility(
            visible: isLoading ?? true,
            child: Center(
                child: Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              ),
              color: Colors.white.withOpacity(0.8),
            )),
          ),
        ],
      ),
    );
  }

  void validateForm() async {
    FormState formState = _formKey.currentState;
    Map value;
    if (formState.validate()) {
      FirebaseUser user = await firebaseAuth.currentUser();
      if (user == null) {
        firebaseAuth.createUserWithEmailAndPassword(
            email: _emailTextController.text,
            password: _passwordTextController.text).then((user) => {
              _userServices.createUser(value)
        });
      }
    }
  }
}

//import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:sibetonapp/pages/login.dart';
//
//class RegisterPage extends StatefulWidget {
//  RegisterPage({Key key}) : super(key: key);
//  @override
//  _RegisterPageState createState() => _RegisterPageState();
//}
//
//class _RegisterPageState extends State<RegisterPage> {
//  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
//  TextEditingController firstNameInputController;
//  TextEditingController lastNameInputController;
//  TextEditingController emailInputController;
//  TextEditingController pwdInputController;
//  TextEditingController confirmPwdInputController;
//  @override
//  initState() {
//    firstNameInputController = new TextEditingController();
//    lastNameInputController = new TextEditingController();
//    emailInputController = new TextEditingController();
//    pwdInputController = new TextEditingController();
//    confirmPwdInputController = new TextEditingController();
//    super.initState();
//  }
//
//  String emailValidator(String value) {
//    Pattern pattern =
//        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//    RegExp regex = new RegExp(pattern);
//    if (!regex.hasMatch(value)) {
//      return 'Email format is invalid';
//    } else {
//      return null;
//    }
//  }
//
//  String pwdValidator(String value) {
//    if (value.length < 8) {
//      return 'Password must be longer than 8 characters';
//    } else {
//      return null;
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        appBar: AppBar(
//          title: Text("Register"),
//        ),
//        body: Container(
//            padding: const EdgeInsets.all(20.0),
//            child: SingleChildScrollView(
//                child: Form(
//              key: _registerFormKey,
//              child: Column(
//                children: <Widget>[
//                  TextFormField(
//                    decoration: InputDecoration(
//                        labelText: 'First Name*', hintText: "John"),
//                    controller: firstNameInputController,
//                    validator: (value) {
//                      if (value.length < 3) {
//                        return "Please enter a valid first name.";
//                      }
//                    },
//                  ),
//                  TextFormField(
//                      decoration: InputDecoration(
//                          labelText: 'Last Name*', hintText: "Doe"),
//                      controller: lastNameInputController,
//                      validator: (value) {
//                        if (value.length < 3) {
//                          return "Please enter a valid last name.";
//                        }
//                      }),
//                  TextFormField(
//                    decoration: InputDecoration(
//                        labelText: 'Email*', hintText: "john.doe@gmail.com"),
//                    controller: emailInputController,
//                    keyboardType: TextInputType.emailAddress,
//                    validator: emailValidator,
//                  ),
//                  TextFormField(
//                    decoration: InputDecoration(
//                        labelText: 'Password*', hintText: "********"),
//                    controller: pwdInputController,
//                    obscureText: true,
//                    validator: pwdValidator,
//                  ),
//                  TextFormField(
//                    decoration: InputDecoration(
//                        labelText: 'Confirm Password*', hintText: "********"),
//                    controller: confirmPwdInputController,
//                    obscureText: true,
//                    validator: pwdValidator,
//                  ),
//                  RaisedButton(
//                    child: Text("Register"),
//                    color: Theme.of(context).primaryColor,
//                    textColor: Colors.white,
//                    onPressed: () { // nambahin ke firestore juga
//                      if (_registerFormKey.currentState.validate()) {
//                        if (pwdInputController.text ==
//                            confirmPwdInputController.text) {
//                          FirebaseAuth.instance
//                              .createUserWithEmailAndPassword(
//                                  email: emailInputController.text,
//                                  password: pwdInputController.text)
//                              .then((currentUser) => Firestore.instance
//                                  .collection("users")
//                                  .document(currentUser.user.uid)
//                                  .setData({
//                                    "uid": currentUser.user.uid,
//                                    "fname": firstNameInputController.text,
//                                    "surname": lastNameInputController.text,
//                                    "email": emailInputController.text,
//                                  })
//                                  .then((result) => {// route ke login page hanya contoh
//                                        Navigator.pushAndRemoveUntil(
//                                            context,
//                                            MaterialPageRoute(
//                                                builder: (context) => LoginPage(
//                                                      title:
//                                                          firstNameInputController
//                                                                  .text +
//                                                              "'s Tasks",
//                                                      uid: currentUser.user.uid,
//                                                    )),
//                                            (_) => false),
//                                        firstNameInputController.clear(),
//                                        lastNameInputController.clear(),
//                                        emailInputController.clear(),
//                                        pwdInputController.clear(),
//                                        confirmPwdInputController.clear()
//                                      })
//                                  .catchError((err) => print(err)))
//                              .catchError((err) => {
//                                    // buat status untuk menampilkan error
//                                    print("ini woy"),
//                                    print(err.toString())
//                                  });
//                        } else {
//                          showDialog(
//                              context: context,
//                              builder: (BuildContext context) {
//                                return AlertDialog(
//                                  title: Text("Error"),
//                                  content: Text("The passwords do not match"),
//                                  actions: <Widget>[
//                                    FlatButton(
//                                      child: Text("Close"),
//                                      onPressed: () {
//                                        Navigator.of(context).pop();
//                                      },
//                                    )
//                                  ],
//                                );
//                              });
//                        }
//                      }
//                    },
//                  ),
//                  Text("Already have an account?"),
//                  FlatButton(
//                    child: Text("Login here!"),
//                    onPressed: () {
//                      Navigator.pop(context);
//                    },
//                  )
//                ],
//              ),
//            ))));
//  }
//}
