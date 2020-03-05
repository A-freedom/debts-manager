import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatelessWidget {
  Future future;
  LoadingScreen({this.future});
  @override
  Widget build(BuildContext context) {

    this.future.then((value){
      Navigator.pop(context);
      return value ;
    });

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SpinKitCubeGrid(
            color: Colors.white,
            size: 80.0,
          ),
        ),
      ),
    );

  }
}

