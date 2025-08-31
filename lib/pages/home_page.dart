import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tutorapp_deneme/components/my_category_card.dart';
import 'package:tutorapp_deneme/components/my_endrawer.dart';
import 'package:tutorapp_deneme/components/my_teacher_card.dart';
import 'package:tutorapp_deneme/pages/tutor_resume_page.dart';

import 'package:tutorapp_deneme/providers/teachers_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedRole;
  // Seçili kategorileri takip eden liste
  Set<String> selectedCategories = {};

  List<String> names = [
    "Fizik",
    "Kimya",
    "Biyoloji",
    "Matematik",
    "Türkçe",
    "İngilizce",
    "Tarih",
    "Coğrafya",
  ];
  List<String> images = [
    "images/quantum-computer_12608409.png",
    "images/test-tubes_752566.png",
    "images/biochemical_11827671.png",
    "images/math-class_13972572.png",
    "images/6416860.jpg",
    "images/7521744.jpg",
    "images/2211.i201.005.F.m004.c9.antique ancient science alchemy astronomy isometric.jpg",
    "images/traveller.jpg",
  ];

  // Kategori seçme/iptal etme fonksiyonu
  void toggleCategory(String category) {
    setState(() {
      if (selectedCategories.contains(category)) {
        selectedCategories.remove(category);
      } else {
        selectedCategories.add(category);
      }
    });
  }

  // Öğretmenleri filtreleme fonksiyonu
  List<dynamic> getFilteredTeachers(List<dynamic> allTeachers) {
    if (selectedCategories.isEmpty) {
      return allTeachers; // Hiç kategori seçilmemişse tüm öğretmenleri göster
    }

    return allTeachers.where((teacher) {
      // Öğretmenin ana branşı seçili kategorilerden birinde mi kontrol et
      return selectedCategories.contains(teacher.subject);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.secondary),
        centerTitle: true,
        title: Text(
          "Ana Sayfa",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      endDrawer: MyEndDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.all(7.r),
            child: SearchBar(
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              elevation: WidgetStatePropertyAll(2),
              backgroundColor: WidgetStatePropertyAll(Colors.white),
              leading: Icon(
                Icons.search,
                color: Theme.of(context).colorScheme.secondary,
              ),
              hintText: "Arama yapın",
              hintStyle: WidgetStatePropertyAll(
                  Theme.of(context).textTheme.headlineSmall),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.w, bottom: 5.h),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Kategoriler",
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ),
          SizedBox(
            height: 0.001.sh,
          ),
          SizedBox(
            height: 0.12.sh,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: names.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return MyCategoryCard(
                  name: names[index],
                  myimage: AssetImage(images[index]),
                  isSelected: selectedCategories.contains(names[index]),
                  onTap: () => toggleCategory(names[index]),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: 2,
              ),
            ),
          ),
          // Seçili kategorileri gösteren bölüm
          if (selectedCategories.isNotEmpty)
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Seçili Kategoriler:",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  SizedBox(height: 8.h),
                  Wrap(
                    spacing: 8.w,
                    runSpacing: 4.h,
                    children: selectedCategories.map((category) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 6.h,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              category,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 4.w),
                            GestureDetector(
                              onTap: () => toggleCategory(category),
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 16.sp,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
                child: Text(
                  "Öğretmenler",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              IconButton(
                padding: EdgeInsets.only(top: 15),
                onPressed: () {},
                icon: Icon(
                  Icons.more_horiz,
                  size: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              )
            ],
          ),
          Expanded(
            child: Consumer<TeachersProvider>(
              builder: (context, provider, child) {
                final allTeachers = provider.allTeachers;
                final filteredTeachers = getFilteredTeachers(allTeachers);

                if (filteredTeachers.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 64.sp,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          selectedCategories.isEmpty
                              ? "Henüz öğretmen bulunmuyor"
                              : "Seçili kategorilerde öğretmen bulunamadı",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                        ),
                        if (selectedCategories.isNotEmpty) ...[
                          SizedBox(height: 8.h),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selectedCategories.clear();
                              });
                            },
                            child: Text(
                              "Filtreyi Temizle",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: filteredTeachers.length,
                  itemBuilder: (context, index) {
                    final teacher = filteredTeachers[index];
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.r, vertical: 3.r),
                      child: MyTeacherCard(
                        teacher: teacher,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  TutorResumePage(teacher: teacher),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
