
import 'package:cloud_firestore/cloud_firestore.dart';

class Customers{
  var list  = [];
  Customers(QuerySnapshot snapshots){
    snapshots.documents.forEach((doc)=> list.add(Customer(doc)));
  }


}
class Customer{
  String name ;
  String user ;
  String address ;
  Timestamp exp ;
  List actions ;
  int total;
  String docId ;

  Customer(doc){
    name = doc['name'] ;
    user = doc['user'] ;
    address = doc['adress'] ;
    exp = doc['exp'] ;
    actions = doc['actions'] ;
    total = doc['total'] ;
    docId = doc.documentID ;
  }
}