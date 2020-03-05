import 'package:debts_manager/services/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      print('------- sign in anon OK ------- ');

      return result.user;
    } catch (e) {
      print('------- sign in anon error ------- ');
      print(e);
      return e;
    }
  }

  Future signOut()async{
    try {
      await _auth.signOut();
      print('------- sign out Ok ------- ');

    } catch (e) {
      print('------- sign out error ------- ');
      print(e);
      return e;
    }
  }

  Future signInWithEmailAndPassword({password, email}) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      print('------- sign in OK ------- ');
      return result.user;
    } catch (e) {
      print('------- sign in error ------- ');
      print(e.message);
      return e;
    }
  }

  Stream get user {
    return _auth.onAuthStateChanged ;
  }

  Future signUpWithEmailAndPassword({password, email,fullName}) async {
    try {
      // ignore: missing_return
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await signInWithEmailAndPassword(email: email, password: password);
//      await CloudFireStore(uId: result.user.uid).updateUserData(totalDebts: 0,fullName: fullName) ;
      result.user.sendEmailVerification();
      print('------- sign up Ok ------- ');
      return result.user;
    } catch (e) {
      print('------- sign up error ------- ');
      print(e.message);
      return e;
    }
  }
}
