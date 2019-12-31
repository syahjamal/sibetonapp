import 'package:flutter/material.dart';


class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: Text('Sulaiman Syah Jamal'),
            accountEmail: Text('sulaimansyahjamal@gmail.com'),
            currentAccountPicture: GestureDetector(
              child: new CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, color: Colors.white),
              ),
            ),
            decoration: new BoxDecoration(color: Colors.red[800]),
          ),
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('My Account'),
              leading: Icon(Icons.person, color: Colors.red[800], size: 30),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('My Favorite'),
              leading: Icon(Icons.favorite, color: Colors.red[800], size: 30),
            ),
          ),
//          InkWell(
//            onTap: () {
//              Navigator.push(context, MaterialPageRoute(
//                builder: (context) => LoginPage()
//              ));
//            },
//            child: ListTile(
//              title: Text('Sign Out'),
//              leading: Icon(Icons.exit_to_app, color: Colors.red[800], size: 30),
//            ),
//          ),
          SizedBox(height: 10.0),
          Divider(
            color: Colors.grey,
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('Setting'),
              leading: Icon(Icons.settings, color: Colors.blueAccent, size: 30),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('About'),
              leading: Icon(
                Icons.help,
                color: Colors.green,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
