import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutorapp_deneme/components/my_button.dart';
import 'package:tutorapp_deneme/components/my_text_field.dart';

class TeacherRegisterPage extends StatelessWidget {
  const TeacherRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.blueGrey,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Öğretmen Kayıt",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(80.sp),
              topRight: Radius.circular(80.sp),
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 30.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Başlık ve açıklama

                  Text(
                    "Kayıt Ol ve Ders Vermeye Başla 😎",
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Lütfen bilgilerinizi eksiksiz giriniz",
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30.h),

                  // Kullanıcı Adı
                  Mytextfield(
                    labelText: "Kullanıcı Adı",
                    hintText: "Adınızı Giriniz",
                    suffixIcon: Icon(Icons.person_2_outlined,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  SizedBox(height: 10.h),

                  // Şifre
                  Mytextfield(
                    labelText: "Şifre",
                    hintText: "Şifre Giriniz",
                    obscureText: true,
                    suffixIcon: Icon(Icons.lock_outline,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  SizedBox(height: 10.h),

                  // Şifre Tekrar
                  Mytextfield(
                    labelText: "Şifre Tekrar",
                    hintText: "Şifreyi Tekrar Giriniz",
                    obscureText: true,
                    suffixIcon: Icon(Icons.lock_outline,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  SizedBox(height: 10.h),

                  // E-mail
                  Mytextfield(
                    labelText: "E-mail Adres",
                    hintText: "E-mail Adresinizi Giriniz",
                    suffixIcon: Icon(Icons.email_outlined,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  SizedBox(height: 10.h),

                  // E-mail Tekrar
                  Mytextfield(
                    labelText: "E-mail Adres Tekrar",
                    hintText: "E-mail Adresinizi Tekrar Giriniz",
                    suffixIcon: Icon(Icons.email_outlined,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Mytextfield(
                      suffixIcon: Icon(
                        Icons.phone_iphone_outlined,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      labelText: "Telefon Numarası",
                      hintText: "Telefon Numaranızı Giriniz"),
                  SizedBox(height: 10.h),
                  Mytextfield(
                      suffixIcon: Icon(
                        Icons.theater_comedy_sharp,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      labelText: "Ana Branşınız",
                      hintText: "Ana Branşınızı Giriniz"),

                  SizedBox(height: 30.h),

                  // Hesap Oluştur Butonu
                  MyButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/LoginPage');
                    },
                    text: "Hesap Oluştur",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
