import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tutorapp_deneme/components/info_card.dart';
import 'package:tutorapp_deneme/components/my_second_button.dart';
import 'package:tutorapp_deneme/components/my_second_teacher_card.dart';
import 'package:tutorapp_deneme/pages/studentpages/book_appointment_page.dart';
import 'package:tutorapp_deneme/providers/teachers_provider.dart';

class TeacherCreateCardPage extends StatefulWidget {
  const TeacherCreateCardPage({
    super.key,
  });

  @override
  State<TeacherCreateCardPage> createState() => _TutorResumePageState();
}

class _TutorResumePageState extends State<TeacherCreateCardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.secondary),
        centerTitle: true,
        title: Text(
          "Kart Oluştur",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Consumer<TeachersProvider>(
        builder: (context, provider, child) {
          final teacher = provider.currentTeacher!;

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
                padding: EdgeInsets.all(12),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Yeni MySecondTeacherCard component'i
                      MySecondTeacherCard(
                        showIcons: false,
                        showContactInfo: false,
                        editmode: true,
                        teacher: teacher,
                        onTap: () {
                          // Kart'a tıklandığında yapılacak işlem
                        },
                      ),

                      SizedBox(height: 20.h),

                      MyInfoCard(
                        icon: Icons.school,
                        title: "Eğitim",
                        value: teacher.education ?? "",
                      ),
                      MyInfoCard(
                        icon: Icons.work_history,
                        title: "Deneyim",
                        value: teacher.experience ?? "",
                      ),
                      MyInfoCard(
                        icon: Icons.location_on,
                        title: "Konum",
                        value: teacher.location ?? "",
                      ),
                      MyInfoCard(
                        icon: Icons.monetization_on,
                        title: "Ders Ücreti",
                        value: teacher.price ?? " ",
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Müsaitlik Takvimi",
                                style:
                                    Theme.of(context).textTheme.displayMedium),
                            const SizedBox(height: 8),
                            SizedBox(
                              height: 50,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  _dayChip("Pazartesi", true),
                                  _dayChip("Salı", false),
                                  _dayChip("Çarşamba", true),
                                  _dayChip("Perşembe", false),
                                  _dayChip("Cuma", true),
                                  _dayChip("Cumartesi", true),
                                  _dayChip("Pazar", false),
                                ],
                              ),
                            ),
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
                                teacher: teacher,
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
          );
        },
      ),
    );
  }

  Widget _dayChip(String day, bool available) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: available
            ? Theme.of(context).colorScheme.surface
            : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          day,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
