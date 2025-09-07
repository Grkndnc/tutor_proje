import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutorapp_deneme/components/my_button.dart';
import 'package:tutorapp_deneme/components/my_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController? emailController;
  TextEditingController? passawordController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10).r,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "GİRİŞ",
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(fontSize: 55),
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    width: 0.7.sw,
                    height: 0.4.sh,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 3.w,
                          color: Theme.of(context).colorScheme.secondary),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("images/logo.png"),
                          fit: BoxFit.contain),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Mytextfield(
                    controller: emailController,
                    labelText: "E mail",
                    hintText: "E-mail Giriniz",
                    suffixIcon: Icon(
                      Icons.supervised_user_circle_sharp,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  Mytextfield(
                    obscureText: true,
                    controller: passawordController,
                    labelText: "Şifre",
                    hintText: "Şifre Giriniz",
                    suffixIcon: Icon(
                      Icons.lock,
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
                      Navigator.pushNamed(context, "/HomePage");
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
