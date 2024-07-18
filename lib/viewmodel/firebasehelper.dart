import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireHelper {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final CollectionReference userDataRef = FirebaseFirestore.instance.collection('users');

  User? get user => auth.currentUser;

  Future<String?> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
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
    }
  }

  Future<String?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return "Success";
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return "An unknown error occurred";
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}
