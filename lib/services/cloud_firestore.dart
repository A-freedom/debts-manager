//
//import 'package:cloud_firestore/cloud_firestore.dart';
//
//class CloudFireStore{
//  final userColoction =  Firestore.instance.collection('user') ;
//  final uId ;
//  CloudFireStore({this.uId});
//  Future updateUserData({fullName,totalDebts})async{
//    userColoction.document(uId).setData({
//      'name':fullName,
//      'totalDebts':totalDebts,
//    });
//  }
//}
//
////{subscriptionUser,fullName,viewCustomer ,expirationDate,totalDebts,location }