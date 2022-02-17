// ignore_for_file: camel_case_types
import 'package:chatapp/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class authService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  chatUserModel? _userFromFirebase(User? chatUser) {
    return chatUser != null ? chatUserModel(chatUser.uid) : null;
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return _userFromFirebase(result.user);
  }

  Future signUpWithEmailAndPassword(String email, String password) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return _userFromFirebase(result.user);
  }

  Future signOut() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    return await _auth.signOut();
  }

  Future resetPassword(String email) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    return await _auth.sendPasswordResetEmail(email: email);
  }
}
