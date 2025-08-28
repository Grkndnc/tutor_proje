import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:tutorapp_deneme/models/teacher.dart';
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
                                  child:
                                      _buildFavoriteTeacherCard(teacher, index),
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

  Widget _buildFavoriteTeacherCard(Teacher teacher, int index) {
    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Container(
        width: double.infinity,
        height: 130.h,
        padding: EdgeInsets.all(16.r),
        child: Row(
          children: [
            // Öğretmen Fotoğrafı
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 40.r,
              backgroundImage: AssetImage(teacher.image),
            ),
            SizedBox(width: 16.w),
            // Öğretmen Bilgileri
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    teacher.name,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    teacher.subject,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Icon(
                        Icons.star_rounded,
                        color: Colors.yellow[600],
                        size: 20.sp,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        teacher.rating,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      SizedBox(width: 16.w),
                      Text(
                        teacher.price,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Butonlar
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Profil Git Butonu
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/tutor-resume');
                  },
                  icon: Icon(
                    Icons.person_outline,
                    size: 16.sp,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Profil",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                  ),
                ),
                // Favorilerden Çıkar Butonu
                IconButton(
                  onPressed: () {
                    _removeFromFavorites(teacher.id);
                  },
                  icon: Icon(
                    Icons.bookmark_remove_rounded,
                    color: Colors.red,
                    size: 24.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _removeFromFavorites(String teacherId) {
    final provider = Provider.of<TeachersProvider>(context, listen: false);
    provider.removeFromFavorites(teacherId);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Öğretmen favorilerden çıkarıldı",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        duration: Duration(seconds: 3),
      ),
    );
  }
}
