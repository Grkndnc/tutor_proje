import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tutorapp_deneme/components/editable_info_field.dart';
import 'package:tutorapp_deneme/components/my_appbar_button.dart';
import 'package:tutorapp_deneme/providers/teachers_provider.dart';

class TeacherProfileEditPage extends StatefulWidget {
  const TeacherProfileEditPage({super.key});

  @override
  State<TeacherProfileEditPage> createState() => _TeacherProfileEditPageState();
}

class _TeacherProfileEditPageState extends State<TeacherProfileEditPage> {
  bool isEditing1 = false;
  bool isEditing2 = false;
  bool isEditing3 = false;
  late TextEditingController nameController;
  late TextEditingController surnameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController adressController;
  late TextEditingController subjectController;
  late TextEditingController educationController;
  late TextEditingController experienceController;
  late TextEditingController imageController;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    final teacher = context.read<TeachersProvider>().currentTeacher;
    if (teacher != null) {
      nameController = TextEditingController(text: teacher.name);
      surnameController = TextEditingController(text: teacher.surname);
      emailController = TextEditingController(text: teacher.email);
      phoneController = TextEditingController(text: teacher.phone);
      adressController = TextEditingController(text: teacher.location);
      subjectController = TextEditingController(text: teacher.subject);
      educationController = TextEditingController(text: teacher.education);
      experienceController = TextEditingController(text: teacher.experience);
      imageController = TextEditingController(text: teacher.image);
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    adressController.dispose();
    subjectController.dispose();
    educationController.dispose();
    experienceController.dispose();
    imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MyAppBarButton(
          icon: CupertinoIcons.arrow_left,
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Profil Düzenle",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Consumer<TeachersProvider>(
        builder: (context, provider, child) {
          final teacher = provider.currentTeacher;

          if (teacher == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return Stack(
            children: [
              Positioned(
                top: 80,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.r),
                      topRight: Radius.circular(30.r),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 80.r),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Kişisel Bilgiler",
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                                IconButton(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  onPressed: () {
                                    setState(() {
                                      if (isEditing1) {
                                        provider.uptadeTeacherName(
                                            nameController.text);
                                        provider.updateTeacherSurname(
                                            surnameController.text);
                                        provider.updateTeacheremail(
                                            emailController.text);
                                        provider.updateTeacherphone(
                                            phoneController.text);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                "Kişisel bilgiler güncellendi"),
                                            backgroundColor: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            duration: Duration(seconds: 2),
                                          ),
                                        );
                                      }
                                      isEditing1 = !isEditing1;
                                    });
                                  },
                                  icon: Icon(isEditing1
                                      ? CupertinoIcons.check_mark
                                      : CupertinoIcons.pencil),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: EditableInfoField(
                                icon: CupertinoIcons.person,
                                title: "Ad",
                                value: teacher.name,
                                controller: nameController,
                                isEditing: isEditing1,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: EditableInfoField(
                                icon: CupertinoIcons.person,
                                title: "Soyad",
                                value: teacher.surname,
                                controller: surnameController,
                                isEditing: isEditing1,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: EditableInfoField(
                                icon: Icons.mail_outline_outlined,
                                title: "E-mail",
                                value: teacher.email,
                                controller: emailController,
                                isEditing: isEditing1,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: EditableInfoField(
                                icon: CupertinoIcons.phone,
                                title: "Telefon",
                                value: teacher.phone,
                                controller: phoneController,
                                isEditing: isEditing1,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Adres Bilgileri",
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                                IconButton(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  onPressed: () {
                                    setState(() {
                                      if (isEditing2) {
                                        provider.updateTeacherAdress(
                                            adressController.text);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                "Adres bilgileri güncellendi"),
                                            backgroundColor: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            duration: Duration(seconds: 2),
                                          ),
                                        );
                                      }
                                      isEditing2 = !isEditing2;
                                    });
                                  },
                                  icon: Icon(
                                    isEditing2
                                        ? CupertinoIcons.check_mark
                                        : CupertinoIcons.pencil,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: EditableInfoField(
                                icon: CupertinoIcons.location_solid,
                                title: "Adres",
                                value: teacher.location ?? "",
                                controller: adressController,
                                isEditing: isEditing2,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Eğitim & Deneyim",
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                                IconButton(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  onPressed: () {
                                    setState(() {
                                      if (isEditing3) {
                                        provider.uptadeTeacherEducation(
                                            educationController.text);
                                        provider.uptadeTeacherExperience(
                                            experienceController.text);
                                        provider.uptadeTeacherSubject(
                                            subjectController.text);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                "Eğitim & Deneyim Güncellendi"),
                                            backgroundColor: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            duration: Duration(seconds: 2),
                                          ),
                                        );
                                      }
                                      isEditing3 = !isEditing3;
                                    });
                                  },
                                  icon: Icon(
                                    isEditing3
                                        ? CupertinoIcons.check_mark
                                        : CupertinoIcons.pencil,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: EditableInfoField(
                                icon: CupertinoIcons.pencil,
                                title: "Eğitim",
                                value: teacher.education ?? "",
                                controller: educationController,
                                isEditing: isEditing3,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: EditableInfoField(
                                icon: CupertinoIcons.bookmark,
                                title: "Ana Branş",
                                value: teacher.subject,
                                controller: subjectController,
                                isEditing: isEditing3,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: EditableInfoField(
                                icon: CupertinoIcons.briefcase,
                                title: "Deneyim",
                                value: teacher.experience ?? "",
                                controller: experienceController,
                                isEditing: isEditing3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Üstte taşan avatar
              Positioned(
                top: 20,
                left: 0,
                right: 0,
                child: Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 67.r,
                        backgroundColor: Colors.blueGrey.shade400,
                        child: CircleAvatar(
                          radius: 65.r,
                          backgroundColor: Colors.white,
                          child: Image.asset(
                            teacher.image ?? "images/social.png",
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 10,
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blueGrey.shade100,
                              border: BoxBorder.all(
                                color: Colors.blueGrey.shade400,
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.add,
                                color: Colors.blueGrey.shade700,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
