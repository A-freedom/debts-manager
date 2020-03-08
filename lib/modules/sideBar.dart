import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:debts_manager/services/authService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SideBar extends StatefulWidget {

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<QuerySnapshot>(context);
    var user;
    if(brews.documents.isNotEmpty) user = brews.documents.first;
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: <Widget>[
        Expanded(
          flex: 100,
          child: Container(
            color: Colors.red,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CircleAvatar(
                    radius: ((height * 1.168) - height) / 2,
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1510832198440-a52376950479?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                  ),
                  Text ((user != null ? user['name'] : '..'),style: TextStyle(fontSize: 25),)
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 168,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                    onTap: () => Navigator.pop(context),
                    leading: Icon(Icons.person_pin),
                    title: Text(
                      'profile',
                      style: TextStyle(fontSize: 18),
                    )),
                ListTile(
                    onTap: () => Navigator.pop(context),
                    leading: Icon(Icons.settings),
                    title: Text(
                      'setting',
                      style: TextStyle(fontSize: 18),
                    )),
                ListTile(
                    onTap: () {
                      AuthService().signOut();
                    },
                    leading: Icon(Icons.arrow_back),
                    title: Text(
                      'logout',
                      style: TextStyle(fontSize: 18),
                    )),
              ],
            ),
          ),
        )
      ],
    );
  }
}
