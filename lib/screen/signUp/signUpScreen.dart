import 'package:debts_manager/screen/loading/loading.dart';
import 'package:debts_manager/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  var password, email,fullName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(hintText: 'Full Name'),
                  onChanged: (fullName) => this.fullName = fullName,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Email'),
                  onChanged: (email) => this.email = email,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Password'),
                  onChanged: (password) => this.password = password,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: ()=>LoadingAction(context: context ,future: _handleSignUp()).future.then((value) => Navigator.pop(context)),
                    child: Text('Sign Up'),
                  ),
                ),
                FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('I\'m have accout',
                        style: TextStyle(color: Colors.white)))
              ],
            ),
          ),
        ));
  }

  // ignore: missing_return
  Future<bool> _handleSignUp() async {
    await AuthService()
        .signUpWithEmailAndPassword(email: this.email, password: this.password,fullName: this.fullName);
    return true;
  }
}
