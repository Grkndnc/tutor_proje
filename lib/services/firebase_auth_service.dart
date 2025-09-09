import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAuthService {
  // kullanıcı yarat FirebaseAuth'a
  Future<void> registerUser({
    required String email,
    required String role,
    required String password,
  }) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    // Firestore'a kayıt etmek
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userCredential.user!.uid)
        .set({
      "email": email,
      "role": role,
      //kullanıcı ne zaman kayıt oldu bilgisi
      "createdAt": FieldValue.serverTimestamp()
    });
  }

  // kullanıcı girişi
  Future<UserCredential> loginUser({
    required String email,
    required String password,
  }) async {
    return await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  //role bilgisi alma
  Future<String?> getUserRole(String uid) async {
    final doc =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();
    if (doc.exists) {
      return doc["role"];
    }
    return null;
  }

  //kullanıcı çıkış
  Future<void> userSignOut() async {
    return await FirebaseAuth.instance.signOut();
  }
}
