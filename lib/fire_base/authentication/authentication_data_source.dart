//@lazySingleton
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationDataSource{
  Future signIn(String email, String password) async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  }
    Future regist(String email, String password) async{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
  }
}
