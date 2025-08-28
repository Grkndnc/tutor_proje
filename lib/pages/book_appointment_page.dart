import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:tutorapp_deneme/models/teacher.dart';

// ignore: must_be_immutable
class BookAppointmentPage extends StatefulWidget {
  Teacher? teacher;
  BookAppointmentPage({super.key, this.teacher});

  @override
  State<BookAppointmentPage> createState() => _BookAppointmentPageState();
}

class _BookAppointmentPageState extends State<BookAppointmentPage> {
  late Teacher currentTeacher;

  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String? selectedDuration;
  final TextEditingController noteController = TextEditingController();

  final List<String> availableDurations = [
    '60 dakika',
    '90 dakika',
    '120 dakika',
    '150 dakika'
  ];

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
        elevation: 0,
        foregroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Text(
          "Randevu Onayla",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
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
                // Tutor Bilgileri Kartı
                Container(
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        radius: 30.r,
                        backgroundImage: AssetImage(currentTeacher.image),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              currentTeacher.name,
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              currentTeacher.subject,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              currentTeacher.price,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 24.h),

                // Tarih Seçimi
                _buildSectionTitle("Tarih Seçin"),
                SizedBox(height: 12.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey),
                    borderRadius: BorderRadius.circular(12.r),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        color: Colors.blueGrey,
                        size: 24.sp,
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Text(
                          selectedDate != null
                              ? "${selectedDate!.day.toString().padLeft(2, '0')}.${selectedDate!.month.toString().padLeft(2, '0')}.${selectedDate!.year}"
                              : "Tarih seçin",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: TextButton(
                          onPressed: () => _selectDate(context),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 8.h),
                            // minimumSize: Size.zero,
                          ),
                          child: Text(
                            "Seç",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 24.h),

                // Saat Seçimi
                _buildSectionTitle("Saat Seçin"),
                SizedBox(height: 12.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey),
                    borderRadius: BorderRadius.circular(12.r),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: Colors.blueGrey,
                        size: 24.sp,
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Text(
                            selectedTime != null
                                ? "${selectedTime!.hour.toString().padLeft(2, '0')}:${selectedTime!.minute.toString().padLeft(2, '0')}"
                                : "Saat seçin",
                            style: Theme.of(context).textTheme.bodyMedium),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: TextButton(
                          onPressed: () => _selectTime(context),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 8.h),
                            // minimumSize: Size.zero,
                          ),
                          child: Text(
                            "Seç",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 24.h),

                // Süre Seçimi
                _buildSectionTitle("Ders Süresi"),
                SizedBox(height: 12.h),
                Container(
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey),
                    borderRadius: BorderRadius.circular(12.r),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: availableDurations.map((duration) {
                      return RadioListTile<String>(
                        title: Text(
                          duration,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        value: duration,
                        groupValue: selectedDuration,
                        onChanged: (value) {
                          setState(() {
                            selectedDuration = value;
                          });
                        },
                        activeColor: Colors.blueGrey,
                      );
                    }).toList(),
                  ),
                ),

                SizedBox(height: 24.h),

                // Not Ekleme
                _buildSectionTitle("Not (İsteğe bağlı)"),
                SizedBox(height: 12.h),
                TextField(
                  controller: noteController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText:
                        "Öğretmene iletmek istediğiniz notları buraya yazabilirsiniz...",
                    hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey,
                        ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(color: Colors.blueGrey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                        width: 2,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),

                SizedBox(height: 32.h),

                // Randevu Onaylama Butonu
                Padding(
                  padding: EdgeInsets.all(5),
                  child: SizedBox(
                    height: 56.h,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed:
                          _canBookAppointment() ? _bookAppointment : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        // foregroundColor: Theme.of(context).colorScheme.primary,
                        //shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        elevation: 4,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.check_circle_outline_outlined,
                            size: 20.sp,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          SizedBox(width: 8.w),
                          Text("Randevu Onayla",
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 16.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          Container(
            width: 4.w,
            height: 20.h,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          SizedBox(width: 12.w),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.3,
                ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    try {
      final DateTime? picked = await showDatePicker(
        helpText: "Tarih Seçiniz",
        fieldLabelText: "AA/GG/YY",
        cancelText: "İptal",
        confirmText: "Tamam",
        context: context,
        initialDate: DateTime.now().add(Duration(days: 1)),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 90)),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: Colors.blueGrey,
                onPrimary: Colors.white,
              ),
              textTheme: Theme.of(context).textTheme.copyWith(
                    headlineLarge: Theme.of(context).textTheme.bodyLarge,
                    bodySmall: Theme.of(context).textTheme.bodySmall,
                    bodyLarge: GoogleFonts.oswald(
                        fontSize: 14.sp, color: Colors.black),
                    bodyMedium: GoogleFonts.oswald(
                        fontSize: 13.sp, color: Colors.black),
                  ),
            ),
            child: child!,
          );
        },
      );
      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
        });
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Tarih seçimi sırasında bir hata oluştu: $e',
            style: GoogleFonts.oswald(color: Colors.white),
          ),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    try {
      final TimeOfDay? picked = await showTimePicker(
        helpText: "Lüften Saat Seçiniz",
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: Colors.blueGrey,
                onPrimary: Colors.white,
              ),
              textTheme: Theme.of(context).textTheme.copyWith(
                    bodyLarge: GoogleFonts.oswald(
                        fontSize: 14.sp, color: Colors.black),
                    bodyMedium: GoogleFonts.oswald(
                        fontSize: 13.sp, color: Colors.black),
                  ),
            ),
            child: child!,
          );
        },
      );
      if (picked != null && picked != selectedTime) {
        setState(() {
          selectedTime = picked;
        });
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Saat seçimi sırasında bir hata oluştu: $e',
            style: GoogleFonts.oswald(color: Colors.white),
          ),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  bool _canBookAppointment() {
    return selectedDate != null &&
        selectedTime != null &&
        selectedDuration != null;
  }

  void _bookAppointment() {
    // Randevu onaylama dialog'u göster
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          title: Text(
            "Randevu Onayı",
            style: GoogleFonts.oswald(
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey,
              fontSize: 20.sp,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Randevu detayları:",
                style: GoogleFonts.oswald(
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "📅 Tarih: ${selectedDate!.day.toString().padLeft(2, '0')}.${selectedDate!.month.toString().padLeft(2, '0')}.${selectedDate!.year}",
                style: GoogleFonts.oswald(
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "🕐 Saat: ${selectedTime!.hour.toString().padLeft(2, '0')}:${selectedTime!.minute.toString().padLeft(2, '0')}",
                style: GoogleFonts.oswald(
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "⏱️ Süre: $selectedDuration",
                style: GoogleFonts.oswald(
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              if (noteController.text.isNotEmpty) ...[
                SizedBox(height: 8.h),
                Text(
                  "📝 Not: ${noteController.text}",
                  style: GoogleFonts.oswald(
                    color: Colors.black,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                "İptal",
                style: GoogleFonts.oswald(
                  color: Colors.blueGrey,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showSuccessDialog();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                foregroundColor: Colors.white,
              ),
              child: Text(
                "Onayla",
                style: GoogleFonts.oswald(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 64.sp,
              ),
              SizedBox(height: 16.h),
              Text(
                "Randevu Başarıyla Oluşturuldu!",
                style: GoogleFonts.oswald(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
              Text(
                "Öğretmeniniz randevu talebinizi inceleyecek ve size geri dönüş yapacaktır.",
                textAlign: TextAlign.center,
                style: GoogleFonts.oswald(
                  fontSize: 14.sp,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          actions: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop(); // Ana sayfaya dön
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  "Tamam",
                  style: GoogleFonts.oswald(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
