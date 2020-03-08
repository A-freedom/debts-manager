import 'package:debts_manager/modules/customers.dart';
import 'package:debts_manager/modules/themeColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ViewCustomerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Map arguments = ModalRoute.of(context).settings.arguments;
    Customer customer = arguments['customer'];
    var textStyle1 = Theme.of(context).primaryTextTheme.headline;
    var textStyle2 = Theme.of(context).primaryTextTheme.subtitle;
    final goldenWeight = (MediaQuery.of(context).size.width / 1.68);
    return Scaffold(
      appBar: AppBar(
        title: Text(customer.name),
      ),
      body: ListView(
        padding: EdgeInsets.only(bottom: 70),
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
                                  backgroundImage: NetworkImage(
                                      'https://images.unsplash.com/photo-1510832198440-a52376950479?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                                  child: Text(
                                    customer.total.toString(),
                                    style: Theme.of(context).textTheme.display1,
                                  ),
                                  radius: ((MediaQuery.of(context).size.width -
                                              (goldenWeight)) /
                                          2) -
                                      9),
                              tag: customer.docId)),
                    ),
                  ),
                  Expanded(
                    flex: 168,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      height: goldenWeight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            'USER',
                            style: textStyle2,
                          ),
                          FlatButton(
                            onPressed: () =>  0 ,
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            child: Text(
                              customer.user,
                              style: textStyle1,
                            ),
                          ),
                          Text(
                            'NAME',
                            style: textStyle2,
                          ),
                          FlatButton(
                              onPressed: () =>  0 ,
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              child: Text(customer.name, style: textStyle1)),
                          Text(
                            'EXP',
                            style: textStyle2,
                          ),
                          FlatButton(
                              onPressed: () =>  0 ,
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              child: Text(
                                  DateFormat('yyyy-MM-dd')
                                      .format(customer.exp.toDate())
                                      .toString(),
                                  style: textStyle1)),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
          Container(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ActionsList(
                    actions: customer.actions,
                  ))),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: secondaryTextColorD,
        ),
        onPressed: () {},
      ),
    );
  }
}

// ignore: must_be_immutable
class ActionsList extends StatelessWidget {
  List actions;

  ActionsList({this.actions});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final list = actions
        .map((action) => Card(
              elevation: 0.0,
              child: Row(children: [
                Expanded(
                  child: TableCell(
                    text: Text('${action.value} DR',
                        style: theme.textTheme.body1),
                  ),
                ),
                Expanded(
                  child: TableCell(
                    text: Text(action.type, style: theme.textTheme.body1),
                  ),
                ),
                Expanded(
                  child: TableCell(
                    text: Text(action.date, style: theme.textTheme.body1),
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
