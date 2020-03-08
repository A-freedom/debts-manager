import 'package:debts_manager/screen/home/homeScreen.dart';
import 'package:debts_manager/screen/signIn/signInScreen.dart';
import 'package:debts_manager/services/databaseService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WraperScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<FirebaseUser>(context);
    if (user == null) {
      return SignInScreen();
    }
    return StreamProvider.value(
        value: DatabaseService(context: context).userStream,
        child: HomeScreen()
    );
  }
}
