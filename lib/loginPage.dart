import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:minne/login.dart';
import 'package:minne/registerPage.dart';
import 'package:minne/styles.dart';
import 'slidePageAnim.dart';

class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
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
                            "Login",
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
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[100]))),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Email adresinizi girin",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400])),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Şifreyi girin",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400])),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      RaisedButton(
                        //for gradient
                        onPressed: () {
                          print('giriş yap tıklandı');
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => login()));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        padding: const EdgeInsets.all(0),
                        child: Ink(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Color(0xFF3594DD),
                              Color(0xFF4563DB),
                              Color(0xFF5036D5),
                              Color(0xFF5B16D0),
                            ]),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Container(
                            constraints: const BoxConstraints(
                                minWidth: 88, minHeight: 36),
                            alignment: Alignment.center,
                            child: const Text(
                              'Giriş yap',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      Text(
                        "Şifrenizi mi unuttunuz?",
                        style: Styles.innerMinorText,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'VE YA',
                        style: TextStyle(color: Colors.black12),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Kayıt',
                          style: Styles.innerMinorText,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('register tıklandı');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => registerPage(),
                                ),
                              );
                            },
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
}
