import 'package:flutter/material.dart';
import 'package:tutorapp_deneme/components/my_button.dart';
import 'package:tutorapp_deneme/components/my_text_field.dart';

class RegisterPageTeacher extends StatelessWidget {
  const RegisterPageTeacher({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //  crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Kayıt ol öğretmen",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
              ),
              Column(
                children: [
                  Mytextfield(
                    labelText: "Kullanıcı Adı",
                    hintText: "Adınızı Giriniz",
                  ),
                  Mytextfield(
                    labelText: "Şifre",
                    hintText: "Şifre Giriniz",
                  ),
                  Mytextfield(
                    labelText: "Şifre Tekrar",
                    hintText: "Şifreyi Tekrar Giriniz",
                  ),
                  Mytextfield(
                    labelText: "E-mail Adres",
                    hintText: "E-mail Adresinizi Giriniz",
                  ),
                  Mytextfield(
                    labelText: "E-mail Adres Tekrar",
                    hintText: "E-mail Adresinizi Tekrar Giriniz",
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MyButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/LoginPage');
                      },
                      text: "Hesap Oluştur"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
