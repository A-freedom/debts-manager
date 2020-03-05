import 'package:debts_manager/modules/themeColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AddCustomerScreen extends StatefulWidget {
  @override
  _AddCustomerScreenState createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  var name, user, address, img;

  @override
  Widget build(BuildContext context) {
    var inputStyle = TextStyle(
      fontSize: 16,
      letterSpacing: 2.1,
    );
    var mainImg = AssetImage("assets/pro.jpeg");
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                  color: theme.primaryColorDark,

                  padding: EdgeInsets.all(10.8),
                  child: Center(
                    child: CircleAvatar(
                      radius: (width - (width / 1.68)) / 2,
                      backgroundImage: mainImg,
                    ),
                  )),
              Expanded(
                flex: 168,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: _formKey,
                    child: ListView(
//                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          validator: (input) => (input != null || input == '')
                              ? 'this isn\'t vail'
                              : null,
//                          onSaved: (input)=> user - input ,
                          style: inputStyle,
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.person_pin,
                              size: 30,
//                              color: Colors.white,
                            ),
                            labelText: 'user',
                            labelStyle: inputStyle,
                          ),
                        ),
                        TextFormField(
                          validator: (input) => (input != null || input == '')
                              ? 'this isn\'t vail'
                              : null,
//                          onSaved: (input)=> name - input ,
                          style: inputStyle,
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.account_box,
                              size: 30,
//                              color: Colors.white,
                            ),
                            labelText: 'name',
                            labelStyle: inputStyle,
                          ),
                        ),
                        TextFormField(
                          validator: (input) => (input != null || input == '')
                              ? 'this isn\'t vail'
                              : null,
//                          onSaved: (input)=> address - input ,
                          style: inputStyle,
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.pin_drop,
                              size: 30,
//                              color: Colors.white,
                            ),
                            labelText: 'address',
                            labelStyle: inputStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _formKey.currentState.validate();
          },
          child: Icon(
            Icons.done_outline,
//            color: secondaryTextColorD,
          ),
        ),
      ),
    );
  }
}
