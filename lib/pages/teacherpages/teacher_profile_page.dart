import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tutorapp_deneme/components/my_show_dialog.dart';
import 'package:tutorapp_deneme/providers/teachers_provider.dart';

class TeacherProfilePage extends StatelessWidget {
  const TeacherProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Profil",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Consumer<TeachersProvider>(
        builder: (context, provider, child) {
          final teacher = provider.currentTeacher;
          return Stack(
            children: [
              Positioned(
                top: 80,
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.r),
                      topRight: Radius.circular(30.r),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 30,
                left: 25,
                child: CircleAvatar(
                  radius: 67.r,
                  backgroundColor: Colors.blueGrey.shade400,
                  child: CircleAvatar(
                    radius: 65.r,
                    child: Image.asset(teacher?.image ?? "images/social.png"),
                  ),
                ),
              ),
              Positioned(
                top: 185,
                left: 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      teacher!.fullName,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(teacher.email)
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsetsGeometry.only(top: 100.h, right: 15.r),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/TeacherProfileEditPage");
                    },
                    child: Container(
                      width: 100.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                          border:
                              BoxBorder.all(width: 1.r, color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(12.r),
                          color: Theme.of(context).colorScheme.surface),
                      child: Center(
                        child: Text(
                          "Profili Düzenle",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentGeometry.center,
                child: Padding(
                  padding: EdgeInsetsGeometry.only(
                      left: 10.r, bottom: 10.r, right: 10.r),
                  child: Container(
                    height: 200.r,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.r),
                        color: Theme.of(context).colorScheme.surface),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AssesmentBox(
                          text: "Puan",
                          intext: 3.8,
                          icon: Icon(
                            Icons.star,
                            color: Colors.amber.shade600,
                            size: 35.sp,
                          ),
                        ),
                        AssesmentBox(
                          text: "Toplam Ders",
                          intext: 387,
                          icon: Icon(
                            Icons.thumb_up_alt_rounded,
                            color: Colors.amber.shade600,
                            size: 30.sp,
                          ),
                        ),
                        AssesmentBox(
                          text: "Favoriler",
                          intext: 47,
                          icon: Icon(
                            Icons.bookmark_added,
                            color: Colors.amber.shade600,
                            size: 30.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 40.r,
                child: Padding(
                  padding: EdgeInsetsGeometry.only(left: 12.r, right: 12.r),
                  child: Column(
                    children: [
                      ProfileBox(
                        icon: Icons.person_pin,
                        text: "Hesabım",
                        onTap: () {},
                      ),
                      ProfileBox(
                        icon: Icons.lock_open_rounded,
                        text: "Şifre Değiştir",
                        onTap: () {
                          Navigator.pushNamed(
                              context, "/TeacherRenewPasswordPage");
                        },
                      ),
                      ProfileBox(
                        icon: Icons.logout,
                        text: "Çıkış",
                        onTap: () {
                          MyShowDialog.show(
                              cancelText: "Hayır",
                              confirmText: "Evet",
                              context: context,
                              title: "Çıkış",
                              content:
                                  "Çıkış yapmak istediğinizden emin misiniz ?",
                              onConfirm: () {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  "/IntroPage",
                                  (route) => false,
                                );
                              });
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class ProfileBox extends StatelessWidget {
  IconData? icon;
  String text;
  void Function()? onTap;
  ProfileBox({
    required this.icon,
    required this.text,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(6.r),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 50.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8).r,
            color: Theme.of(context).colorScheme.surface,
          ),
          child: Padding(
            padding: EdgeInsetsGeometry.all(12.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(icon, color: Theme.of(context).colorScheme.secondary),
                SizedBox(width: 10.r),
                Text(
                  text,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class AssesmentBox extends StatelessWidget {
  Icon icon;
  String text;
  double intext;
  AssesmentBox({
    super.key,
    required this.icon,
    required this.text,
    required this.intext,
  });

  @override
  Widget build(BuildContext context) {
    String realvalue =
        intext % 1 == 0 ? intext.toStringAsFixed(0) : intext.toStringAsFixed(1);
    return Container(
      margin: EdgeInsets.all(5.r),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(24.r),
      ),
      height: 170.r,
      width: 110.r,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          icon,
          Text(
            realvalue,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ],
      ),
    );
  }
}
