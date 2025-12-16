import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutorapp_deneme/components/about_section.dart';
import 'package:tutorapp_deneme/components/day_selector.dart';
import 'package:tutorapp_deneme/components/editable_info_field.dart';
import 'package:tutorapp_deneme/components/my_second_button.dart';
import 'package:tutorapp_deneme/components/my_second_teacher_card.dart';
import 'package:tutorapp_deneme/models/teacher.dart';
import 'package:tutorapp_deneme/pages/studentpages/book_appointment_page.dart';

class TutorResumePage extends StatefulWidget {
  final Teacher? teacher;

  const TutorResumePage({
    super.key,
    this.teacher,
  });

  @override
  State<TutorResumePage> createState() => _TutorResumePageState();
}

class _TutorResumePageState extends State<TutorResumePage> {
  // Öğretmen bilgileri (parametre olarak gelirse onu kullan, yoksa varsayılan)
  late Teacher currentTeacher;

  @override
  void initState() {
    super.initState();

    // Eğer parametre olarak öğretmen geldiyse onu kullan, yoksa varsayılan öğretmen
    currentTeacher = widget.teacher ??
        Teacher(
          id: '1',
          name: 'Gürkan',
          surname: "DİNÇ",
          subject: 'Matematik',
          rating: '4.7',
          price: '350 TRY/Sa',
          image: 'images/quantum-computer_12608409.png',
          education: 'ODTÜ Matematik, Yüksek Lisans - Eğitim Bilimleri',
          experience: '7 yıl özel ders deneyimi',
          location: 'İstanbul / Online',
          email: 'gurkan.dinc@email.com',
          phone: '+90 555 123 45 67',
          secondarySubjects: [
            'Fizik',
            'Biyoloji',
            'Kimya',
            'Edebiyat',
            'Tarih',
            'Coğrafya',
            'İngilizce'
          ],
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.secondary),
        centerTitle: true,
        title: Text(
          "Öğretmen Profili",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
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
            padding: EdgeInsets.all(12),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Yeni MySecondTeacherCard component'i
                  MySecondTeacherCard(
                    editmode: false,
                    showIcons: true,
                    teacher: currentTeacher,
                    onTap: () {
                      // Kart'a tıklandığında yapılacak işlem
                    },
                  ),

                  if ((currentTeacher.bio ?? "").isNotEmpty)
                    AboutSection(
                      aboutText: currentTeacher.bio,
                      editMode: false,
                      aboutController: TextEditingController(),
                    ),
                  SizedBox(height: 20.h),
                  if ((currentTeacher.experience ?? "").isNotEmpty)
                    EditableInfoField(
                        icon: Icons.work_history,
                        title: "Deneyim",
                        value: currentTeacher.experience ?? "",
                        isEditing: false),
                  if ((currentTeacher.location ?? "").isNotEmpty)
                    EditableInfoField(
                        icon: Icons.location_on,
                        title: "Konum",
                        value: currentTeacher.location ?? "",
                        isEditing: false),

                  if ((currentTeacher.education ?? "").isNotEmpty)
                    EditableInfoField(
                      icon: Icons.edit,
                      title: "Eğitim",
                      value: currentTeacher.education ?? "",
                      isEditing: false,
                    ),
                  if ((currentTeacher.price ?? "").isNotEmpty)
                    EditableInfoField(
                        icon: Icons.monetization_on,
                        title: "Ders Ücreti",
                        value: currentTeacher.price ?? "  ",
                        isEditing: false),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Müsaitlik Takvimi",
                            style: Theme.of(context).textTheme.displayMedium),
                        const SizedBox(height: 8),
                        DaySelector(
                          currenTeacher: currentTeacher,
                          editable: false,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  // Randevu Al Butonu
                  MySecondButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookAppointmentPage(
                            teacher: currentTeacher,
                          ),
                        ),
                      );
                    },
                    text: "Randevu Al",
                    icon: Icons.calendar_month,
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
