import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minne/auth_service.dart';
import 'package:minne/login.dart';
import 'package:minne/loginPage.dart';

class registerPage extends StatefulWidget {
  @override
  _registerPageState createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController0 = TextEditingController();
  TextEditingController _passwordController1 = TextEditingController();
  String passValidation;
  String errorHandle = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.1, 0.4, 0.7, 0.9],
                      colors: [
                        Color(0xFF3594DD),
                        Color(0xFF4563DB),
                        Color(0xFF5036D5),
                        Color(0xFF5B16D0),
                      ],
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                          child: Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Center(
                          child: Text(
                            "Register",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10))
                            ]),
                        child: Form(
                          autovalidateMode: AutovalidateMode.always,
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[100]))),
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _emailController,
                                  validator: (String val) {
                                    if (val.isEmpty || !val.contains('@')) {
                                      return 'e-mail geçersiz';
                                    }
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: "Email adresinizi girin",
                                    labelStyle:
                                        TextStyle(color: Colors.grey[400]),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  validator: (String val) {
                                    passValidation = val;
                                    if (val.isEmpty || val.length < 7) {
                                      return 'en az 7 karakter olmalı';
                                    }
                                  },
                                  controller: _passwordController0,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: "Şifrenizi girin",
                                    labelStyle:
                                        TextStyle(color: Colors.grey[400]),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  obscureText: true,
                                  validator: (String val) {
                                    if (val.isEmpty || val.length < 7) {
                                      return 'en az 7 karakter olmalı';
                                    }

                                    if (passValidation != val) {
                                      return 'İki şifre örtüşmüyor.';
                                    }
                                  },
                                  controller: _passwordController1,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: "Şifrenizi tekrar girin",
                                    labelStyle:
                                        TextStyle(color: Colors.grey[400]),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () async {
                          print('kayıt ol tıklandı');

                          if (_formKey.currentState.validate()) {
                            _registerAccount();

                            print('kayıt ol fonksiyonu çalıştı');
                          }
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(colors: [
                                Color(0xFF3594DD),
                                Color(0xFF4563DB),
                                Color(0xFF5036D5),
                                Color(0xFF5B16D0),
                              ])),
                          child: Center(
                            child: Text(
                              "Kayıt ol",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void _registerAccount() async {
    try {
      errorHandle = null;
      final User user = (await _auth.createUserWithEmailAndPassword(
              email: _emailController.text.toString().trim(),
              password: _passwordController0.text.toString().trim()))
          .user;

      _auth.signOut(); //kullanıcı kayıt olunca firebase doğrudan oturum açıyor

      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => loginPage()));
    } on FirebaseAuthException catch (e) {
      errorHandle = e.code;
      print('error kodu :  $errorHandle');
    } catch (e) {
      print(e);
      errorHandle = e.toString();
    }
  }
  //TODO email allready taken- bad password eror handling
//bad formatted
}
