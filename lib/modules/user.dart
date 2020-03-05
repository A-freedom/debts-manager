import 'package:flutter/cupertino.dart';

var userList = [
  new User(fullName: 'Ali Moua', status: true),
  new User(fullName: 'Husee Ala', status: false),
  new User(fullName: 'God Zol', status: false),
  new User(fullName: 'Blabla', status: true),
  new User(fullName: 'Ali Moua', status: false),
  new User(fullName: 'Ali Moua', status: false),
  new User(fullName: 'Husee Ala', status: true),
  new User(fullName: 'God Zol', status: false),
  new User(fullName: 'Blabla', status: true),
  new User(fullName: 'Ali Moua', status: true),
  new User(fullName: 'Husee Ala', status: false),
  new User(fullName: 'God Zol', status: false),
  new User(fullName: 'Blabla', status: true),
  new User(fullName: 'Ali Moua', status: false),
  new User(fullName: 'Ali Moua', status: false),
  new User(fullName: 'Husee Ala', status: true),
  new User(fullName: 'God Zol', status: false),
  new User(fullName: 'Blabla', status: true),
  new User(fullName: 'Ali Moua', status: false),
  new User(fullName: 'Ali Moua', status: false),
  new User(fullName: 'Husee Ala', status: true),
  new User(fullName: 'God Zol', status: false),
  new User(fullName: 'Blabla', status: true),
  new User(fullName: 'Ali Moua', status: true),
  new User(fullName: 'Husee Ala', status: false),
  new User(fullName: 'God Zol', status: false),
  new User(fullName: 'Blabla', status: true),
  new User(fullName: 'Ali Moua', status: false),
  new User(fullName: 'Ali Moua', status: false),
  new User(fullName: 'Husee Ala', status: true),
  new User(fullName: 'God Zol', status: false),
  new User(fullName: 'Blabla', status: true),
];

class User {
  String fulName = '';

  Icon userImg;
  int total = 0;
  bool status;

  String userName = 'H1_0012';

  String phoneNumber = '07735575153';

  String exp = '21';

  var actions = [
      Action(value: '60',type: 'Active',date: '20/2/10\n12:00'),
      Action(value: '60',type: 'Active',date: '20/2/10\n12:00'),
      Action(value: '60',type: 'Active',date: '20/2/10\n12:00'),
      Action(value: '60',type: 'Active',date: '20/2/10\n12:00'),
      Action(value: '60',type: 'Active',date: '20/2/10\n12:00'),
      Action(value: '60',type: 'Active',date: '20/2/10\n12:00'),
      Action(value: '60',type: 'Active',date: '20/2/10\n12:00'),
      Action(value: '60',type: 'Active',date: '20/2/10\n12:00'),
      Action(value: '60',type: 'Active',date: '20/2/10\n12:00'),
      Action(value: '60',type: 'Active',date: '20/2/10\n12:00'),
      Action(value: '60',type: 'Active',date: '20/2/10\n12:00'),
  ];

  User({fullName, bool status}) {
    this.fulName = fullName;
//    this.userImg = userImg ;
    this.status = status;
  }

//  User({this.fulName,this.userImg,this.total,this.status});
}

List<User> getUser() {
  return userList;
}
class Action{
  var value ;
  var type ;
  var date ;
  Action({this.value,this.type,this.date});
}