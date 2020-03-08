import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:debts_manager/modules/customers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class DatabaseService {
  final userDb = Firestore.instance;

  var user;

  Stream<Customers> get customersStream {
    return userDb
        .collection('users/${user.uid}/customers')
        .snapshots()
        .map((snapshot) => Customers(snapshot));
  }

  DatabaseService({context, listen}) {
    this.user = Provider.of<FirebaseUser>(context,
        listen: listen == null ? true : listen);
  }

  Future updateUserData({fullname, totalDebts}) async {
    userDb.collection('users').document(user.uid).setData({
      'name': fullname,
      'totalDebts': totalDebts,
    });
  }

  Future addCustomer({data}) {
    print(user.uid);
    var customerDb = userDb.collection('users/${user.uid}/customers');
    return customerDb.add(data);
  }

  Stream<QuerySnapshot> get userStream {
    return userDb.collection('users').snapshots();
  }
}

//{subscriptionUser,fullName,viewCustomer ,expirationDate,totalDebts,location }
