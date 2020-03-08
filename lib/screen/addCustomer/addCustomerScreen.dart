import 'package:debts_manager/modules/themeColors.dart';
import 'package:debts_manager/services/databaseService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddCustomerScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();
  var name , user, address ;
  var _obscureText = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  _showSnackBar(message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final wight = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
        appBar: AppBar(
          title: Text('add customer'),
//          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                Center(
                  child: CircleAvatar(
                    radius: (wight * 0.38) / 2,
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1510832198440-a52376950479?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: InputDecoration(hintText: 'USER'),
                  onSaved: (user) => this.user = user,
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: InputDecoration(hintText: 'NAME'),
                  onSaved: (name) => this.name = name,
                  obscureText: _obscureText,
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: InputDecoration(hintText: 'ADRESS'),
                  onSaved: (address) => this.address = address,
                  obscureText: _obscureText,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save() ;
              DatabaseService(context: context, listen: false)
                  .addCustomer(data: {
                'user': this.user,
                'name': this.name,
                'address': this.address,
                'exp': DateTime.now() ,
                'total':0,
                'actions': List(),
              }).then( (s)=> Navigator.pop(context)).catchError((err) => _showSnackBar(err.message)) ;
            }
          },
          child: Icon(
            Icons.done,
            color: secondaryTextColorD,
          ),
        ));
  }
}

