import 'package:firebase_auth/firebase_auth.dart';

/*abstract class BaseAuth {
  Future<String> signIn(String email, String password);

  Future<String> signUp(String email, String password);

  Future<FirebaseUser> getCurrentUser();

  Future<void> sendEmailVerification();

  Future<void> signOut();

  Future<bool> isEmailVerified();
}*/

class Auth{
  FirebaseAuth _firebaseAuth;
  //FirebaseUser user;
  String email;

  Auth() {
    this._firebaseAuth = FirebaseAuth.instance;
  }
  Future<String> getEmail() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    email = user.email;
    return email;
  }
  //Sign In
  Future<String> signIn(String email, String password) async {
    try{
      AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return user.uid;
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
  //Sign Up
  Future<String> signUp(String email, String password) async {
    try{
      AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return user.uid;
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
  //Sign Out
  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }
  Future<bool> isLoggedIn() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    if (user == null) {
      return false;
    }
    return true;
  }

  Future<void> sendEmailVerification() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    user.sendEmailVerification();
  }

  Future<bool> isEmailVerified() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.isEmailVerified;
  }
}