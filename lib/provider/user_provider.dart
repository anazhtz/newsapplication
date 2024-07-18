import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProvider with ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final CollectionReference userDataRef =
      FirebaseFirestore.instance.collection('users');
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<String?> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    _setLoading(true);
    try {
      UserCredential response = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final data = {
        'Id': response.user?.uid,
        'Name': name,
        'Email': email,
      };
      await userDataRef.doc(response.user?.uid).set(data);
      return "Success";
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return "An unknown error occurred";
    } finally {
      _setLoading(false);
    }
  }

  Future<String?> signIn({
    required String email,
    required String password,
  }) async {
    _setLoading(true);
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return "Success";
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return "An unknown error occurred";
    } finally {
      _setLoading(false);
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
  }

  void _setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }
}
