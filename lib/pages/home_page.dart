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
            height: 10,
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
            padding: EdgeInsets.only(left: 15, bottom: 5),
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
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: 2,
              ),
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
                final teachers = provider.allTeachers;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: teachers.length,
                  itemBuilder: (context, index) {
                    final teacher = teachers[index];
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
