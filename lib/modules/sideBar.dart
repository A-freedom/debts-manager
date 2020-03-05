import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('hello word' ,style: Theme.of(context).textTheme.display1,),
    );
  }
}
