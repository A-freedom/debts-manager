import 'package:debts_manager/screen/loading/loading.dart';
import 'package:debts_manager/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SignInScreen extends StatelessWidget {
  var password, email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(title: Text('Sign In'),centerTitle: true,),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
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
                    onPressed: () => LoadingAction(context: context ,future: _handleSignIn()),
                    child: Text('Sign In'),
                  ),
                ),
                FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signUp');
                    },
                    child: Text('I don\' have accout',
                        style: TextStyle(color: Colors.white)))
              ],
            ),
          ),
        ));
  }

  // ignore: missing_return
  Future<bool> _handleSignIn() async {
    await AuthService()
        .signInWithEmailAndPassword(email: this.email, password: this.password);
  }
}
