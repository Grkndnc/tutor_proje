import 'package:flutter/material.dart';
import 'package:tutorapp_deneme/components/my_text_field.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Şifremi Unuttum',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Mytextfield(
              labelText: "Email adresi", hintText: "Email adresi giriniz"),
          Mytextfield(labelText: "Şifre", hintText: "Şifre giriniz"),
        ],
      ),
    );
  }
}
