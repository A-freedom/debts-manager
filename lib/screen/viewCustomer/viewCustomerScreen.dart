import 'package:debts_manager/modules/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class ViewCustomerScreen extends StatelessWidget {
  User user;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Map arguments = ModalRoute.of(context).settings.arguments;
    var userObject = arguments['user'];
    user = userObject;
    var textStyle1 = Theme.of(context).primaryTextTheme.headline;
    var textStyle2 = Theme.of(context).primaryTextTheme.subhead;
    final goldenWeight = (MediaQuery.of(context).size.width / 1.68);
    return Scaffold(
      appBar: AppBar(
        title: Text(user.fulName),
      ),
      body: ListView(
        padding: const EdgeInsets.only( bottom: 70),
        children: <Widget>[
          Container(
              color: theme.primaryColorDark,
              padding: EdgeInsets.all(8),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 100,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      height: goldenWeight,
                      child: Center(
                          child: Hero(
                              child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/pro.jpeg'),
                                  child: Icon(
                                    Icons.warning,
//                                    color: Colors.amber,
                                    size: (!user.status) ? 50 : 0,
                                  ),
                                  radius: ((MediaQuery.of(context).size.width -
                                              (goldenWeight)) /
                                          2) -
                                      9),
                              tag: user)),
                    ),
                  ),
                  Expanded(
                    flex: 168,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      height: goldenWeight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'USER',
                            style: textStyle2,
                          ),
                          Text(
                            user.userName,
                            style: textStyle1,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'NAME',
                            style: textStyle2,
                          ),
                          Text(user.fulName, style: textStyle1),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'EXP',
                            style: textStyle2,
                          ),
                          Text(user.exp, style: textStyle1),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
          Container(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ActionsTable(
              actions: user.actions,
            ),
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
//          color: Colors.white,
        ),
        onPressed: () {},
      ),
    );
  }
}

// ignore: must_be_immutable
class ActionsTable extends StatelessWidget {
  List actions;

  ActionsTable({this.actions});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final list =
    actions.map((action) => Card(
      elevation: 0.0,
      child: Row(children: [
        Expanded(
          child: TableCell(
            text: Text('${action.value} DR',style:theme.textTheme.body1),
          ),
        ),
        Expanded(
          child: TableCell(
            text: Text(action.type,style:theme.textTheme.body1),
          ),
        ),
        Expanded(
          child: TableCell(
            text: Text(action.date,style:theme.textTheme.body1),
          ),
        ),
      ]),
    ))
        .toList();

    return Column(
      children: list,
    );
  }
}

// ignore: must_be_immutable
class TableCell extends StatelessWidget {
  var text;

  TableCell({this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: text),
    );
  }
}
