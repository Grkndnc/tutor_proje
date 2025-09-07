import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tutorapp_deneme/pages/commonpages/login_page.dart';
import 'package:tutorapp_deneme/pages/studentpages/home_page.dart';

class AuthPage extends StatefulWidget {
  AuthPage({super.key});

  @override
  State<AuthPage> createState() => _MainPageCheckUsersLoginsState();
}

class _MainPageCheckUsersLoginsState extends State<AuthPage> {
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
          return StudentHomePage();
        }
        return LoginPage();
      },
    );
  }
}
