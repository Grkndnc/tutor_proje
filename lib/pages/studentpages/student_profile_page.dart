import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tutorapp_deneme/components/about_section.dart';
import 'package:tutorapp_deneme/providers/student_provider.dart';
import 'package:tutorapp_deneme/components/student_profile_card.dart';
import 'package:tutorapp_deneme/components/editable_info_field.dart';
import 'package:tutorapp_deneme/components/dropdown_info_field.dart';
import 'package:tutorapp_deneme/components/interests_section.dart';

class StudentProfilePage extends StatefulWidget {
  const StudentProfilePage({super.key});

  @override
  State<StudentProfilePage> createState() => _StudentProfilePageState();
}

class _StudentProfilePageState extends State<StudentProfilePage> {
  bool isEditing = false;

  // Text editing controllers
  late TextEditingController nameController;
  late TextEditingController surnameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  late TextEditingController schoolController;
  late TextEditingController bioController;

  String selectedEducationLevel = '';
  String selectedGrade = '';

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    final student = context.read<StudentProvider>().currentStudent;
    if (student != null) {
      nameController = TextEditingController(text: student.name);
      surnameController = TextEditingController(text: student.surname);
      emailController = TextEditingController(text: student.email);
      phoneController = TextEditingController(text: student.phone);
      addressController = TextEditingController(text: student.address);
      schoolController = TextEditingController(text: student.school);
      bioController = TextEditingController(text: student.bio);
      selectedEducationLevel = student.educationLevel;
      selectedGrade = student.grade;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    schoolController.dispose();
    bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.secondary),
        centerTitle: true,
        title: Text(
          "Profilim",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          Consumer<StudentProvider>(
            builder: (context, provider, child) {
              return IconButton(
                onPressed: () {
                  setState(() {
                    if (isEditing) {
                      _saveChanges(provider);
                    }

                    isEditing = !isEditing;
                  });
                },
                icon: Icon(
                  isEditing ? Icons.save : Icons.edit,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              );
            },
          ),
        ],
      ),
      body: Consumer<StudentProvider>(
        builder: (context, provider, child) {
          final student = provider.currentStudent;
          if (student == null) {
            return Center(
              child: Text(
                "Öğrenci bilgisi bulunamadı",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            );
          }

          return Padding(
            padding: EdgeInsets.only(top: 25.r),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.r),
                  topRight: Radius.circular(50.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.r),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Profil Resmi ve Temel Bilgiler
                      StudentProfileCard(student: student),

                      // Hakkında Bölümü
                      AboutSection(
                          aboutText: student.bio ?? "",
                          editMode: isEditing,
                          aboutController: bioController),

                      // Kişisel Bilgiler
                      Text(
                        "Kişisel Bilgiler",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      SizedBox(height: 12.h),

                      EditableInfoField(
                        icon: Icons.person,
                        title: "Ad",
                        value: student.name,
                        controller: nameController,
                        isEditing: isEditing,
                      ),

                      EditableInfoField(
                        icon: Icons.person_outline,
                        title: "Soyad",
                        value: student.surname,
                        controller: surnameController,
                        isEditing: isEditing,
                      ),

                      EditableInfoField(
                        icon: Icons.email,
                        title: "E-posta",
                        value: student.email,
                        controller: emailController,
                        isEditing: isEditing,
                        keyboardType: TextInputType.emailAddress,
                      ),

                      EditableInfoField(
                        icon: Icons.phone,
                        title: "Telefon",
                        value: student.phone,
                        controller: phoneController,
                        isEditing: isEditing,
                        keyboardType: TextInputType.phone,
                      ),

                      EditableInfoField(
                        icon: Icons.location_on,
                        title: "Adres",
                        value: student.address,
                        controller: addressController,
                        isEditing: isEditing,
                        maxLines: 2,
                      ),

                      SizedBox(height: 20.h),

                      // Eğitim Bilgileri
                      Text(
                        "Eğitim Bilgileri",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      SizedBox(height: 12.h),

                      DropdownInfoField(
                        icon: Icons.school,
                        title: "Eğitim Seviyesi",
                        value: student.educationLevel,
                        options: ["İlkokul", "Ortaokul", "Lise", "Üniversite"],
                        onChanged: isEditing
                            ? (value) {
                                setState(() {
                                  selectedEducationLevel = value!;
                                });
                              }
                            : null,
                      ),

                      EditableInfoField(
                        icon: Icons.business,
                        title: "Okul",
                        value: student.school,
                        controller: schoolController,
                        isEditing: isEditing,
                      ),

                      DropdownInfoField(
                        icon: Icons.grade,
                        title: "Sınıf",
                        value: student.grade,
                        options: [
                          "1. Sınıf",
                          "2. Sınıf",
                          "3. Sınıf",
                          "4. Sınıf",
                          "5. Sınıf",
                          "6. Sınıf",
                          "7. Sınıf",
                          "8. Sınıf",
                          "9. Sınıf",
                          "10. Sınıf",
                          "11. Sınıf",
                          "12. Sınıf"
                        ],
                        onChanged: isEditing
                            ? (value) {
                                setState(() {
                                  selectedGrade = value!;
                                });
                              }
                            : null,
                      ),

                      SizedBox(height: 20.h),

                      // İlgi Alanları
                      Text(
                        "İlgi Alanları",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      SizedBox(height: 12.h),

                      InterestsSection(
                        student: student,
                        provider: provider,
                        isEditing: isEditing,
                        onAddInterest: () => _showAddInterestDialog(provider),
                      ),

                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showAddInterestDialog(StudentProvider provider) {
    final TextEditingController interestController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "İlgi Alanı Ekle",
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: TextField(
            controller: interestController,
            decoration: InputDecoration(
              hintText: "İlgi alanınızı yazın...",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.secondary,
                  width: 2,
                ),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                "İptal",
                style:
                    TextStyle(color: Theme.of(context).colorScheme.secondary),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (interestController.text.isNotEmpty) {
                  provider.addInterest(interestController.text.trim());
                  Navigator.of(context).pop();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                foregroundColor: Colors.white,
              ),
              child: Text("Ekle"),
            ),
          ],
        );
      },
    );
  }

  void _saveChanges(StudentProvider provider) {
    final updatedStudent = provider.currentStudent!.copyWith(
      name: nameController.text,
      surname: surnameController.text,
      email: emailController.text,
      phone: phoneController.text,
      address: addressController.text,
      educationLevel: selectedEducationLevel,
      school: schoolController.text,
      grade: selectedGrade,
      bio: bioController.text,
    );

    provider.updateStudent(updatedStudent);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Profil bilgileri güncellendi"),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        duration: Duration(seconds: 2),
      ),
    );
  }
}
