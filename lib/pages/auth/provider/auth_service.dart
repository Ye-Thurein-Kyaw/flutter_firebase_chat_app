import 'package:firebase_auth/firebase_auth.dart';

import '../../../network/api_service.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final ApiService _apiService = ApiService();

  Future<UserCredential> singInWithEmailAndPassword({required String email, required String password}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      await _apiService.setDocument(
        collectionPath: 'Users',
        data: {'uid': userCredential.user!.uid, 'email': email},
        documentId: userCredential.user!.uid,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<UserCredential> registerWithEmailAndPassword({required String email, required String password}) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await _apiService.setDocument(
        collectionPath: 'Users',
        data: {'uid': userCredential.user!.uid, 'email': email},
        documentId: userCredential.user!.uid,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  User? getCurrentUser() {
    return _auth.currentUser;
  }
}
