import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutorapp_deneme/components/my_button.dart';

import 'package:tutorapp_deneme/components/my_text_field.dart';
import 'package:tutorapp_deneme/pages/commonpages/login_page.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        foregroundColor: Colors.blueGrey,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Şifremi Yenile",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 50.h),
        child: Container(
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60).r,
              topRight: Radius.circular(60.r),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 18.w, top: 40.h, bottom: 10.h),
                child: Align(
                    alignment: AlignmentGeometry.centerLeft,
                    child: Text("Şifre",
                        style: Theme.of(context).textTheme.displayMedium)),
              ),
              Mytextfield(
                  labelText: "Yeni Şifre", hintText: " Yeni Şifrenizi Giriniz"),
              Padding(
                padding: EdgeInsets.only(left: 18.w, top: 5.h, bottom: 5.h),
                child: Align(
                    alignment: AlignmentGeometry.centerLeft,
                    child: Text("Yeni Şifre Onayı",
                        style: Theme.of(context).textTheme.displayMedium)),
              ),
              Mytextfield(
                  labelText: "Yeni Şifre Tekrar",
                  hintText: "Yeni Şifrenizi Giriniz"),
              SizedBox(height: 30.h),
              MyButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: Colors.white,
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20.h,
                              ),
                              CircleAvatar(
                                radius: 35.r,
                                backgroundColor: Colors.blueGrey.shade100,
                                child: Icon(
                                  Icons.email_outlined,
                                  size: 50.r,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                "Şifrenizi sıfırlamak için size bir mail gönderdik.        Lütfen E-mail adresinizi kontrol ediniz.",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginPage(),
                                    ),
                                    (route) => false,
                                  );
                                },
                                child: Container(
                                  height: 35.h,
                                  width: 180.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40.r),
                                      color: Colors.blueGrey.shade100),
                                  child: Center(
                                    child: Text(
                                      "Devam Et",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  text: "Şifreyi Yenile")
            ],
          ),
        ),
      ),
    );
  }
}
