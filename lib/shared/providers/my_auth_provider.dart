import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyAuthProvider extends ChangeNotifier {
  User? user;

  bool _hadVerification = false;

  // Initialize the listener in the constructor
  MyAuthProvider() {
    _initializeAuthStateListener();
  }

  void _initializeAuthStateListener() async {
    FirebaseAuth.instance.authStateChanges().listen(
      (User? user) {
        this.user = user;

        if (this.user != null && this.user!.emailVerified) {
          _hadVerification = true;
          notifyListeners();
          //TODO: talves haga falta colocar una bandera 'hasLoggedOut' que se ponga true solo cuando el
          //TODO: usuario se deslogea, con tal de que este ifelse notifique al router, pero talves
          //TODO: no sea necesario.
        } else if (this.user == null && _hadVerification) {
          _hadVerification = false;
          notifyListeners();
        }
      },
    );
  }

  Future<void> signIn(String email, String password) async {
    try {
      // Set persistence before signing in
      await FirebaseAuth.instance.setPersistence(Persistence.LOCAL);

      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print("Error during sign-in: ${e.message}");
      rethrow;
    }
  }

  Future<void> signOut() async {
    user = null;
    await FirebaseAuth.instance.signOut();
  }

  bool get isLoggedIn => user != null;

  Future<void> signup(String email, String password, String displayName) async {
    UserCredential userCredential;

    try {
      userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      userCredential.user!.updateDisplayName(displayName);
      await userCredential.user!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      rethrow;
    }
  }
}
