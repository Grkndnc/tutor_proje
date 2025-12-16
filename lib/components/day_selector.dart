import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tutorapp_deneme/models/teacher.dart';
import 'package:tutorapp_deneme/providers/teachers_provider.dart';

// ignore: must_be_immutable
class DaySelector extends StatelessWidget {
  late Teacher currenTeacher;
  final bool editable;

  List<String> allDays = [
    'Pazartesi',
    'Salı',
    "Çarşamba",
    'Perşembe',
    'Cuma',
    'Cumartesi',
    'Pazar'
  ];

  DaySelector({
    super.key,
    this.editable = true,
    required this.currenTeacher,
  });

  @override
  Widget build(BuildContext context) {
    final selectedDays = currenTeacher.availableDays ?? [];

    return SizedBox(
      height: 50.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: allDays.map((day) {
          final isSelected = selectedDays.contains(day);

          return GestureDetector(
            onTap: editable
                ? () {
                    final provider = context.read<TeachersProvider>();
                    provider.toggledays(day);
                  }
                : null, // ❗ Öğrenci sayfasında tıklama yok
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: isSelected
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
            ),
          );
        }).toList(),
      ),
    );
  }
}
