import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:tutorapp_deneme/pages/teacherpages/teacher_create_card_page.dart';
import 'package:tutorapp_deneme/pages/teacherpages/teacher_home_page.dart';
import 'package:tutorapp_deneme/pages/teacherpages/teacher_profile_page.dart';

class TeacherNavBar extends StatefulWidget {
  const TeacherNavBar({super.key});

  @override
  State<TeacherNavBar> createState() => _TeacherNavBarState();
}

class _TeacherNavBarState extends State<TeacherNavBar> {
  int selectedIndex = 0;

  List<Widget> pages = [
    TeacherHomePage(),
    TeacherCreateCardPage(),
    TeacherProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
        child: GNav(
          haptic: true, // haptic feedback
          duration: Duration(milliseconds: 500),
          gap: 8,
          color: Theme.of(context).colorScheme.primary,
          activeColor: Theme.of(context).colorScheme.secondary,
          iconSize: 28,
          padding: EdgeInsets.symmetric(horizontal: 35.h, vertical: 20.w),
          selectedIndex: selectedIndex,
          onTabChange: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Ana Sayfa',
            ),
            GButton(
              activeBorder: Border.all(color: Colors.black, width: 2),
              icon: Icons.add,
              text: 'Kart Oluştur',
            ),
            GButton(
              icon: Icons.person,
              text: 'Profil',
            )
          ],
        ),
      ),
    );
  }
}
