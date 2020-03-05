import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'loadingScreen.dart';

class LoadingAction {
  Future future ;
  LoadingAction({context, this.future}) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
        LoadingScreen(
          future: future,
        )
      ),
    );
  }
}
