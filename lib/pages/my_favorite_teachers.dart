import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:tutorapp_deneme/components/my_second_teacher_card.dart';

import 'package:tutorapp_deneme/pages/tutor_resume_page.dart';
import 'package:tutorapp_deneme/providers/teachers_provider.dart';

class MyFavoriteTeachers extends StatefulWidget {
  const MyFavoriteTeachers({super.key});

  @override
  State<MyFavoriteTeachers> createState() => _MyFavoriteTeachersState();
}

class _MyFavoriteTeachersState extends State<MyFavoriteTeachers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.secondary),
        centerTitle: true,
        title: Text(
          "Favori Öğretmenlerim",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 30),
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
            child: Consumer<TeachersProvider>(
              builder: (context, provider, child) {
                final favoriteTeachers = provider.favoriteTeachers;
                return favoriteTeachers.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.favorite_border,
                              size: 80.sp,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              "Henüz favori öğretmeniniz yok",
                              style: Theme.of(context).textTheme.displayMedium,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              "Öğretmen profillerini inceleyerek\nfavorilerinize ekleyebilirsiniz",
                              style: Theme.of(context).textTheme.bodyMedium,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Favori Öğretmenleriniz (${favoriteTeachers.length})",
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          SizedBox(height: 16.h),
                          Expanded(
                            child: ListView.builder(
                              itemCount: favoriteTeachers.length,
                              itemBuilder: (context, index) {
                                final teacher = favoriteTeachers[index];
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 16.h),
                                  child: MySecondTeacherCard(
                                    teacher: teacher,
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => TutorResumePage(
                                            teacher: teacher,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
              },
            ),
          ),
        ),
      ),
    );
  }
}
