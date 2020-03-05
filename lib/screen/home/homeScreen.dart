


import 'package:debts_manager/modules/themeColors.dart';
import 'package:debts_manager/modules/user.dart';
import 'package:debts_manager/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'UserWidget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var level = 0;
  var userList = getUser();

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<FirebaseUser>(context);
    return Scaffold(
      appBar: AppBar(title: Text(user.email),),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
                onPressed: () => AuthService().signOut(),
                icon: Icon(
                  Icons.toc,
//                color: Colors.white,
                )),
            IconButton(
                onPressed: () => null,
                icon: Icon(
                  Icons.more_vert,
//                  color: Colors.white
                ))
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          addAutomaticKeepAlives: false,
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          children: userList
              .map((user) => FlatButton(
                    padding: EdgeInsets.all(0),
                    child: UserWidget(
                      user: user,
                      status: false,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/viewCustomer',
                          arguments: {'user': user});
//                Navigator.popAndPushNamed(context, '/userView');
                    },
                  ))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0.0,
        onPressed: () {
          Navigator.pushNamed(context, '/addCustomer');
        },
        child: Icon(
          Icons.add,
//          color: secondaryTextColorD,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
