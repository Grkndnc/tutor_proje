import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tutorapp_deneme/pages/commonpages/login_page.dart';
import 'package:tutorapp_deneme/pages/studentpages/home_page.dart';
import 'package:tutorapp_deneme/pages/teacherpages/teacher_home_page.dart';

import 'package:tutorapp_deneme/services/firebase_auth_service.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _MainPageCheckUsersLoginsState();
}

class _MainPageCheckUsersLoginsState extends State<AuthPage> {
  final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();

  @override
  Widget build(BuildContext context) {
    // kullanıcı giriş yaptı mı ?
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(
            child: Text("Bir hata oluştu"),
          );
        }
        if (snapshot.hasData) {
          final uid = snapshot.data!.uid;
          print(uid);
          return FutureBuilder<String?>(
            future: _firebaseAuthService.getUserRole(uid),
            builder: (context, rolesnapshot) {
              if (rolesnapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              if (rolesnapshot.hasError) {
                return Text("Rol bilgisi alınamadı");
              }
              final role = rolesnapshot.data;
              print(role);
              if (role == "teacher") {
                return TeacherHomePage();
              }
              if (role == "student") {
                return StudentHomePage();
              }
              return LoginPage();
            },
          );
        }
        return LoginPage();
      },
    );
  }
}
