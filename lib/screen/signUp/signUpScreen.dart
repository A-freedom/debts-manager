import 'package:debts_manager/modules/themeColors.dart';
import 'package:debts_manager/screen/loading/loading.dart';
import 'package:debts_manager/services/authService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignUpScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final GlobalKey<FormState> _formKey = GlobalKey();

  _showSnackBar(message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }

  Future<bool> _handleSignUp() async {
    await AuthService(context: context)
        .signUpWithEmailAndPassword(
            email: this.email, password: this.password, fullname: fullname)
        .then((user) => Navigator.pushNamedAndRemoveUntil(
            context, '/wraper', (predicate) => predicate.isFirst));
//        .catchError((e) => _showSnackBar(e.message));
    return true;
  }

  var password, password2, email, fullname;
  var _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Sign Up'),
          centerTitle: true,
        ),
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
                  decoration: InputDecoration(hintText: 'full name'),
                  onSaved: (fullname) => this.fullname = fullname,
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: InputDecoration(hintText: 'email'),
                  onSaved: (email) => this.email = email,
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    if (value != password2) {
                      return 'the password isn\'t match';
                    }
                    return null;
                  },
                  decoration: InputDecoration(hintText: 'password'),
                  onChanged: (password) => this.password = password,
                  obscureText: _obscureText,
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    if (value != password) {
                      return 'the password isn\'t match';
                    }
                    return null;
                  },
                  decoration:
                      InputDecoration(hintText: ' confirm the password'),
                  onChanged: (password2) => this.password2 = password2,
                  obscureText: _obscureText,
//                  onTap: toggleObscureText,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: RaisedButton(
                        color: secondaryColorD,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            LoadingAction(
                                context: context, future: _handleSignUp());
                          }
                        },
                        child: Text('SIGN UP'),
                      ),
                    ),
                    RaisedButton(
                        color: primaryColorD,
                        onPressed: () => Navigator.pop(context),
                        child: Text('SIGN IN',
                            style: TextStyle(color: Colors.white)))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
