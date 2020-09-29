import 'package:flutter/material.dart';
import 'package:minne/styles.dart';

class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
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
        child: Center(
          child: Column(
            children: <Widget>[
              Text('Login'),
              Image(
                image: AssetImage('assets/assets1.jpg'),
                height: 450,
                width: 250,
              ),
              TextField(
                autofocus: true,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'password'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
