import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tutorapp_deneme/models/teacher.dart';
import 'package:tutorapp_deneme/providers/teachers_provider.dart';

class MyTeacherCard extends StatelessWidget {
  final Teacher teacher;
  final VoidCallback? onPressed;

  const MyTeacherCard({
    super.key,
    required this.teacher,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TeachersProvider>(
      builder: (context, provider, child) {
        // ignore: unused_local_variable
        // final isFavorite = provider.isFavorite(teacher.id);
        return Card(
          color: Colors.white,
          elevation: 2,
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 40.r,
                      backgroundImage:
                          AssetImage(teacher.image ?? "/images/social.png"),
                    ),
                    Text(
                      teacher.name,
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      teacher.subject,
                      style: Theme.of(context).textTheme.titleSmall,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star_rounded,
                          color: Colors.yellow[600],
                          size: 30,
                        ),
                        SizedBox(width: 10),
                        Text(
                          teacher.rating ?? "  ",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                    // Profil butonu
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextButton.icon(
                        onPressed: onPressed,
                        icon: Icon(
                          Icons.arrow_back_outlined,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        label: Text(
                          "Profile git",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    ),
                    Text(
                      teacher.price ?? "   ",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
