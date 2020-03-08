
import 'package:debts_manager/services/databaseService.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  var context ;
  AuthService({this.context});
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //sign in anon
  Future signInAnon() async {
      AuthResult result = await _auth.signInAnonymously();

      return result.user;
  }

  Future signOut() async {
      await _auth.signOut();
  }

  Future<FirebaseUser> signInWithEmailAndPassword({password, email}) async {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return result.user;

  }

  Stream get user {
    return _auth.onAuthStateChanged;
  }

  Future signUpWithEmailAndPassword({password, email, fullname}) async {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await signInWithEmailAndPassword(email: email, password: password);
      result.user.sendEmailVerification();
      await DatabaseService(context: context,listen: false).updateUserData(fullname: fullname,totalDebts: 0) ;
      return result.user;

  }
}
