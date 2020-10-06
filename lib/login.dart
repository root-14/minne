import 'package:flutter/material.dart';
import 'package:minne/model.dart';
import 'package:minne/styles.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  final List<userModel> users = [
    userModel("1", "lorem", "abc@mail.com", "https://picsum.photos/250?image=9",
        123, 321),
  ];

  Widget buildUsersCard(BuildContext context, int index) {
    final user = users[index];
    return new Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child:
                        Image.network(user.userPicUrl, height: 50, width: 50),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(user.userName),
                        Text(
                          user.emailAdress,
                          style: Styles.innerMinorGrey,
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) =>
            buildUsersCard(context, index),
      ),
    );
  }
}
