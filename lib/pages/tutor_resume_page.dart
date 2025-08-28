import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tutorapp_deneme/components/info_card.dart';
import 'package:tutorapp_deneme/models/teacher.dart';
import 'package:tutorapp_deneme/pages/book_appointment_page.dart';
import 'package:tutorapp_deneme/providers/teachers_provider.dart';

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
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 0.97.sw,
                    height: 0.24.sh,
                    child: Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18.r),
                            color: Theme.of(context).colorScheme.surface),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 0.35.sw,
                                    height: 0.13.sh,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1.w,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary),
                                      borderRadius: BorderRadius.circular(22),
                                      shape: BoxShape.rectangle,
                                      image: DecorationImage(
                                          image:
                                              AssetImage(currentTeacher.image),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 15.r, top: 15.r),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          currentTeacher.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium,
                                        ),
                                        SizedBox(
                                          height: 12.r,
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                                overflow: TextOverflow.ellipsis,
                                                "Ana Branş",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                                overflow: TextOverflow.ellipsis,
                                                currentTeacher.subject,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.share_outlined,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                          ),
                                        ),
                                        Consumer<TeachersProvider>(
                                          builder: (context, provider, child) {
                                            final isFavorite = provider
                                                .isFavorite(currentTeacher.id);
                                            return IconButton(
                                              onPressed: () {
                                                provider.toggleFavorite(
                                                    currentTeacher);
                                                _showSnackBar(
                                                    context, isFavorite);
                                              },
                                              icon: Icon(
                                                isFavorite
                                                    ? Icons.bookmark
                                                    : Icons.bookmark_border,
                                                color: isFavorite
                                                    ? Theme.of(context)
                                                        .colorScheme
                                                        .secondary
                                                    : Theme.of(context)
                                                        .colorScheme
                                                        .secondary,
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10.r),
                                  Text(
                                    "Yan Branşlar", // ilk branş
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                  SizedBox(height: 5.r),
                                  Wrap(
                                    spacing: 5, // yan boşluk
                                    runSpacing: 1, // alt boşluk
                                    children: currentTeacher.secondarySubjects
                                        .map((subject) => Text("$subject,"))
                                        .toList(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Hakkında",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.r),
                    child: SizedBox(
                      width: double.infinity,
                      height: 56.h,
                      child: ElevatedButton(
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
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.surface,
                          foregroundColor:
                              Theme.of(context).colorScheme.secondary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          elevation: 5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.calendar_today,
                              size: 20.sp,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            SizedBox(width: 8.w),
                            Text("Randevu Al",
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, bool wasFavorite) {
    final provider = Provider.of<TeachersProvider>(context, listen: false);
    final isNowFavorite = provider.isFavorite(currentTeacher.id);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isNowFavorite
              ? "Öğretmen favorilere eklendi"
              : "Öğretmen favorilerden çıkarıldı",
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        duration: Duration(seconds: 2),
        action: SnackBarAction(
          label: isNowFavorite ? "Favorileri Görüntüle" : "Tamam",
          textColor: Colors.white,
          onPressed: () {
            if (isNowFavorite) {
              Navigator.pushNamed(context, '/my-favorite-teachers');
            }
          },
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
