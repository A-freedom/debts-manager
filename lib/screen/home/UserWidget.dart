// ignore: must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../modules/user.dart';

// ignore: must_be_immutable
class UserWidget extends StatelessWidget {
  User user;
  bool status;

  UserWidget({
    user,
    status,
  }) {
    this.user = user;
  }

  double getStatus() {
    if (user.status) {
      return 0.0;
    }
    return 20.0;
  }

//  Color statusColor() {
//    if (user.total < 0) {
//      return Colors.pink;
//    }
//    return Colors.amber;
//  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.body1;
    return Card(
      child: Container(
        height: 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    flex: 100,
                    child: Center(
                      child: Hero(
                        child: CircleAvatar(
//                          backgroundColor: Colors.white,
//                          radius: 35,
                          backgroundImage: NetworkImage('https://images.unsplash.com/photo-1510832198440-a52376950479?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                          child: Icon(
                            Icons.warning,
//                          color: Colors.amber,
                            size: getStatus(),
                          ),
                        ),
                        tag: user,
                      ),
                    )),
                Expanded(
                    flex: 168,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'name ',
                              style: textStyle,
                            ),
                            Text('${user.fulName}', style: textStyle),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  Text('total_ ', style: textStyle),
                                  Text(
                                    '40',
                                    style: textStyle.apply(
//                                      color: statusColor()
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
