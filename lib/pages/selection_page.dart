import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutorapp_deneme/components/my_button.dart';

class RoleSelectionPage extends StatefulWidget {
  const RoleSelectionPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RoleSelectionPageState createState() => _RoleSelectionPageState();
}

class _RoleSelectionPageState extends State<RoleSelectionPage> {
  String? selectedRole; // "student" veya "teacher"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Rol Seç",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30.h),
              Text("Rolünü Seç",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontSize: 24)),

              // Öğrenci Kartı
              Column(
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          width: 0.5.sw,
                          height: 0.3.sh,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage(
                                "images/student 1.png",
                              ),
                            ),
                          ),

                          // öğretmen resmi
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedRole = "student";
                          });
                        },
                        child: Container(
                          width: 0.1.sw,
                          height: 0.1.sh,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            shape: BoxShape.circle,
                            color: selectedRole == "student"
                                ? Theme.of(context).colorScheme.surface
                                : Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text("Öğrenci",
                      style: Theme.of(context).textTheme.headlineSmall),
                ],
              ),

              // Öğretmen Kartı
              Column(
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          width: 0.5.sw,
                          height: 0.3.sh,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage(
                                "images/Teacher 1.png",
                              ),
                            ),
                          ),

                          // öğretmen resmi
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedRole = "teacher";
                          });
                        },
                        child: Container(
                          width: 0.1.sw,
                          height: 0.1.sh,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 4.w,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            shape: BoxShape.circle,
                            color: selectedRole == "teacher"
                                ? Theme.of(context).colorScheme.surface
                                : Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text("Öğretmen",
                      style: Theme.of(context).textTheme.headlineSmall),
                ],
              ),

              SizedBox(height: 30.h),

              MyButton(
                  onPressed: selectedRole == null
                      ? null // rol seçilmediyse buton pasif
                      : () {
                          if (selectedRole == "student") {
                            Navigator.pop(context);
                            Navigator.pushNamed(
                                context, "/RegisterPageStudent");
                          } else {
                            Navigator.pop(context);
                            Navigator.pushNamed(
                                context, "/RegisterPageTeacher");
                          }
                        },
                  text: "SEÇ")
            ],
          ),
        ),
      ),
    );
  }
}
