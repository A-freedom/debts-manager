// ignore: must_be_immutable
import 'package:debts_manager/modules/customers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserWidget extends StatelessWidget {
  bool status;

  Customer customer;

  UserWidget(this.customer);

  double getStatus() {
    if (customer.total < 80){
      return 0.0;
    }
    return 20.0;
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => Future(()=>Navigator.pushNamed(context, '/viewCustomer',arguments: {'customer': customer})),
        leading: Hero(
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1510832198440-a52376950479?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
            child: Icon(
              Icons.warning,
              size: getStatus(),
            ),
          ),
          tag: customer.docId,
        ),
        title: Text(customer.name),
        subtitle: Text(customer.user),
        trailing: Text(customer.total.toString()),
      ),
    );
  }
}
