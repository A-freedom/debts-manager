import 'package:debts_manager/screen/addCustomer/addCustomerScreen.dart';
import 'package:debts_manager/screen/home/homeScreen.dart';
import 'package:debts_manager/screen/loading/loadingScreen.dart';
import 'package:debts_manager/screen/signIn/signInScreen.dart';
import 'package:debts_manager/screen/signUp/signUpScreen.dart';
import 'package:debts_manager/screen/viewCustomer/viewCustomerScreen.dart';
import 'package:debts_manager/screen/wraper/warperScreen.dart';
import 'package:debts_manager/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'modules/themeColors.dart';


void main() {runApp(MainApp());}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<FirebaseUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: myTheme(),
        initialRoute: '/wraper',
        routes: {
          '/wraper': (context) => WraperScreen(),
          '/home': (context) => HomeScreen(),
          '/signUp': (context) => SignUpScreen(),
          '/signIn': (context) => SignInScreen(),
          '/loading': (context) => LoadingScreen(),
          '/viewCustomer': (context) => ViewCustomerScreen(),
          '/addCustomer': (context) => AddCustomerScreen(),
        },
      ),
    );
  }

  ThemeData myTheme() {
    var baseThem = ThemeData.dark();
    return baseThem.copyWith(
      primaryColor: primaryColorD,
      primaryColorDark: primaryDarkColorD,
      primaryColorLight: primaryLightColorD,
      accentColor: secondaryColorD,
      bottomAppBarColor: secondaryDarkColorD,
      buttonColor: secondaryDarkColorD,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryTextColorD,
      ),
      bottomAppBarTheme: BottomAppBarTheme(color: primaryDarkColorD),
      iconTheme: IconThemeData(color: secondaryTextColorD),
      textTheme: TextTheme(
          body1: TextStyle(
            fontSize: 16,
            letterSpacing: 1,
          )),
    );
  }
}
