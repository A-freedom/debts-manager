import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreenWithFuture extends StatelessWidget {
  Future future;
  LoadingScreenWithFuture({this.future});
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


class LoadingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

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
