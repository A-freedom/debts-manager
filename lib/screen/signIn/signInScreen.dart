import 'package:debts_manager/modules/themeColors.dart';
import 'package:debts_manager/screen/loading/loading.dart';
import 'package:debts_manager/services/authService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {


  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final GlobalKey<FormState> _formKey = GlobalKey();



  _showSnackBar(message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }

  Future<bool> _handleSignIn() async {
    await AuthService(context: context)
        .signInWithEmailAndPassword(email: this.email, password: this.password)
        .catchError((e) => _showSnackBar(e.message));
    return true;
  }

  var password, email;
  var _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(title: Text('Sign In'), centerTitle: true,),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: ListView(
//              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: InputDecoration(hintText: 'Email'),
                  onSaved: (email) => this.email = email,
                ),
                TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  decoration: InputDecoration(hintText: 'Password'),
                  onSaved: (password) => this.password = password,
                  obscureText: _obscureText,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: RaisedButton(
                        color: secondaryColorD,
                        onPressed: () {
                          if(_formKey.currentState.validate()){
                            _formKey.currentState.save();
                            LoadingAction(context: context, future: _handleSignIn());
                          }
                        },
                        child: Text('SIGN IN'),
                      ),
                    ),
                    RaisedButton(
                        color: primaryColorD,
                        onPressed: () {
                          Navigator.pushNamed(context, '/signUp');
                        },
                        child: Text('SIGN UP',
                            style: TextStyle(color: Colors.white)))
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
