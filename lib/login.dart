import 'package:flutter/material.dart';
import 'package:minne/model.dart';
import 'package:minne/styles.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}
//KATILDIĞIM EVENTLER TODO:
//DRAWER

class _loginState extends State<login> {
  final List<userModel> users = [
    userModel("1", "lorem", "abc@mail.com", "https://picsum.photos/250?image=9",
        123, 321),
    userModel(
        "2", "ipsum", "def@mail.com", "https://picsum.photos/250", 123, 321),
  ];

  Widget buildUsersCard(BuildContext context, int index) {
    final user = users[index];
    return Container(
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
    return Scaffold(
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) =>
            buildUsersCard(context, index),
      ),
      appBar: AppBar(
        title: Center(child: Text('Katıldığım Eventler')),
        flexibleSpace: Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
                colors: [
                  const Color(0xFF3366FF),
                  const Color(0xFF00CCFF),
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Container(
          width: 60,
          height: 60,
          child: Icon(
            Icons.add_location,
            size: 35,
          ),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF3366FF),
                  const Color(0xFF00CCFF),
                ],
              )),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://static.wikia.nocookie.net/ortadunya/images/1/12/Gandalf2.jpg/revision/latest?cb=20191223114037'),
                          radius: 43,
                    
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'YOUR_NAME_HERE',
                        style: Styles.innerTitle
                      ),
                    ),
                  ],
                )),
            ListTile(
              leading: Icon(Icons.message),
              title: Text(
                'Mesajlar',
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text(
                'Profilim',
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                'Ayarlar',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
