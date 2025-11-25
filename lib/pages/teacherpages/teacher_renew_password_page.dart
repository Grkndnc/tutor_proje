import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutorapp_deneme/components/my_button.dart';
import 'package:tutorapp_deneme/components/my_show_dialog.dart';
import 'package:tutorapp_deneme/components/my_text_field.dart';

class TeacherRenewPasswordPage extends StatelessWidget {
  const TeacherRenewPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.blueGrey,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Şifre Yenile",
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
                padding: const EdgeInsets.only(top: 24, bottom: 60).h,
                child: Text(
                  "Yeni Şifre Oluştur",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontSize: 24.sp),
                ),
              ),
              Mytextfield(
                  labelText: "E-mail Adresi",
                  hintText: "E-mail Adresi Giriniz"),
              Mytextfield(
                  labelText: "Eski Şifre", hintText: " Eski Şifrenizi Giriniz"),
              Mytextfield(labelText: "Yeni Şifre", hintText: "Şifre Giriniz"),
              Mytextfield(
                  labelText: "Yeni Şifre Tekrar",
                  hintText: "Tekrar Şifre Giriniz"),
              SizedBox(height: 100.h),
              MyButton(
                  onPressed: () {
                    MyShowDialog.show(
                        cancelText: "Onayla ✅",
                        context: context,
                        title: "Şifre yenile",
                        content: "Şifreniz Yenilenecek Onaylıyor Musunuz ?",
                        onConfirm: () {});
                  },
                  text: "Şifreyi Yenile")
            ],
          ),
        ),
      ),
    );
  }
}
