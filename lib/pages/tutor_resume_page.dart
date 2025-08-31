import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutorapp_deneme/components/info_card.dart';
import 'package:tutorapp_deneme/components/my_second_button.dart';
import 'package:tutorapp_deneme/components/my_second_teacher_card.dart';
import 'package:tutorapp_deneme/models/teacher.dart';
import 'package:tutorapp_deneme/pages/book_appointment_page.dart';

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
          name: 'Gürkan DİNÇ',
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
                    teacher: currentTeacher,
                    onTap: () {
                      // Kart'a tıklandığında yapılacak işlem
                    },
                  ),

                  SizedBox(height: 20.h),

                  Text(
                    "Hakkında",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    "Bu öğretmen hakkında uzun açıklama buraya gelecek... ",
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.start,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                  MyInfoCard(
                    icon: Icons.school,
                    title: "Eğitim",
                    value: currentTeacher.education,
                  ),
                  MyInfoCard(
                    icon: Icons.work_history,
                    title: "Deneyim",
                    value: currentTeacher.experience,
                  ),
                  MyInfoCard(
                    icon: Icons.location_on,
                    title: "Konum",
                    value: currentTeacher.location,
                  ),
                  MyInfoCard(
                    icon: Icons.monetization_on,
                    title: "Ders Ücreti",
                    value: currentTeacher.price,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Müsaitlik Takvimi",
                            style: Theme.of(context).textTheme.displayMedium),
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
