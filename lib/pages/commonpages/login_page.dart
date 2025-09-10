import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutorapp_deneme/components/my_button.dart';
import 'package:tutorapp_deneme/components/my_text_field.dart';
import 'package:tutorapp_deneme/services/firebase_auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    try {
      await _firebaseAuthService.loginUser(
          email: emailController.text.trim(),
          password: passwordController.text.trim());

      Navigator.pushNamed(context, "/AuthPage");
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Giriş hatası: $e"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.secondary),
        title: Text(
          "Giriş",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Container(
                    width: 0.7.sw,
                    height: 0.4.sh,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          image: AssetImage("images/Mathematics-amico.png"),
                          fit: BoxFit.contain),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Mytextfield(
                    controller: emailController,
                    labelText: "E-mail",
                    hintText: "E-mail Giriniz",
                    suffixIcon: Icon(
                      Icons.supervised_user_circle_outlined,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  Mytextfield(
                    obscureText: true,
                    controller: passwordController,
                    labelText: "Şifre",
                    hintText: "Şifre Giriniz",
                    suffixIcon: Icon(
                      Icons.lock_outline,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/ForgotPasswordPage");
                    },
                    child: Text("Şifrenizi unuttunuz?",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontSize: 18)),
                  ),
                  SizedBox(height: 0.03.sh),
                  MyButton(
                    text: "Giriş Yap",
                    onPressed: () {
                      _login();
                    },
                  ),
                  SizedBox(height: 0.01.sh),
                  MyButton(
                    text: "Hesap Oluştur",
                    onPressed: () {
                      Navigator.pushNamed(context, "/RoleSelectionPage");
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
