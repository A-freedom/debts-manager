import 'package:debts_manager/modules/customers.dart';
import 'package:debts_manager/modules/sideBar.dart';
import 'package:debts_manager/modules/themeColors.dart';
import 'package:debts_manager/screen/loading/loadingScreen.dart';
import 'package:debts_manager/services/authService.dart';
import 'package:debts_manager/services/databaseService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'UserWidget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  _showSnackBar(message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: SideBar(),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0.0,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                  onPressed: () => _scaffoldKey.currentState.openDrawer(),
                  icon: Icon(
                    Icons.toc,
//                color: Colors.white,
                  )),
              IconButton(
                  onPressed: () => AuthService(context: context).signOut(),
                  icon: Icon(
                    Icons.more_vert,
//                  color: Colors.white
                  ))
            ],
          ),
        ),
        body: SafeArea(
          child: StreamBuilder<Customers>(
              stream: DatabaseService(context: context).customersStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    addAutomaticKeepAlives: false,
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    children: snapshot.data.list
                        .map((customer) => UserWidget(customer))
                        .toList(),
                  );
                }
                if (snapshot.hasError) {
                  _showSnackBar('we have an error');
                }
                return LoadingScreen();
              }),
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 0.0,
          onPressed: () {
            Navigator.pushNamed(context, '/addCustomer');
          },
          child: Icon(
            Icons.add,
            color: secondaryTextColorD,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
