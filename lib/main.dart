import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:tutorapp_deneme/pages/commonpages/Intro_page.dart';
import 'package:tutorapp_deneme/Themes/themes.dart';
import 'package:tutorapp_deneme/pages/commonpages/forgot_password_page.dart';
import 'package:tutorapp_deneme/pages/studentpages/home_page.dart';
import 'package:tutorapp_deneme/pages/commonpages/login_page.dart';
import 'package:tutorapp_deneme/pages/studentpages/register_page_student.dart';
import 'package:tutorapp_deneme/pages/teacherpages/register_page_teacher.dart';
import 'package:tutorapp_deneme/pages/commonpages/selection_page.dart';
import 'package:tutorapp_deneme/pages/studentpages/tutor_resume_page.dart';
import 'package:tutorapp_deneme/pages/studentpages/book_appointment_page.dart';
import 'package:tutorapp_deneme/pages/studentpages/my_favorite_teachers.dart';
import 'package:tutorapp_deneme/pages/studentpages/student_profile_page.dart';
import 'package:tutorapp_deneme/providers/teachers_provider.dart';
import 'package:tutorapp_deneme/providers/student_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(400, 1300),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => TeachersProvider()),
            ChangeNotifierProvider(create: (_) => StudentProvider()),
          ],
          child: MaterialApp(
            home: const IntroPage(),
            theme: appTheme,
            debugShowCheckedModeBanner: false,
            routes: {
              "/IntroPage": (context) => const IntroPage(),
              "/LoginPage": (context) => const LoginPage(),
              "/RegisterPageStudent": (context) => const RegisterPageStudent(),
              "/RegisterPageTeacher": (context) => const RegisterPageTeacher(),
              "/HomePage": (context) => HomePage(),
              "/RoleSelectionPage": (context) => RoleSelectionPage(),
              "/ForgotPasswordPage": (context) => ForgotPasswordPage(),
              "/AppointmentPage": (context) => TutorResumePage(),
              "/TeacherProfilePage": (context) => TutorResumePage(),
              "/StudentProfilePage": (context) => StudentProfilePage(),
              "/book-appointment": (context) => BookAppointmentPage(),
              "/my-favorite-teachers": (context) => MyFavoriteTeachers(),
            },
          ),
        );
      },
    );
  }
}
