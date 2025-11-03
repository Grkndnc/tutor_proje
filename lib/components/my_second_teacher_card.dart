import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tutorapp_deneme/models/teacher.dart';
import 'package:tutorapp_deneme/providers/teachers_provider.dart';

class MySecondTeacherCard extends StatefulWidget {
  final Teacher teacher;
  final VoidCallback? onTap;
  final bool showContactInfo;

  const MySecondTeacherCard({
    super.key,
    required this.teacher,
    this.onTap,
    this.showContactInfo = true,
  });

  @override
  State<MySecondTeacherCard> createState() => _MySecondTeacherCardState();
}

class _MySecondTeacherCardState extends State<MySecondTeacherCard> {
  bool showAllSubjects = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.r),
          color: Theme.of(context).colorScheme.surface,
        ),
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100.w,
                    height: 100.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2.w,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      borderRadius: BorderRadius.circular(16.r),
                      image: DecorationImage(
                        image: AssetImage(widget.teacher.image),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),

                  // İsim ve iletişim bilgileri
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.teacher.name,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        SizedBox(height: 8.h),

                        // Email bilgisi
                        if (widget.showContactInfo) ...[
                          Row(
                            children: [
                              Icon(
                                Icons.email_outlined,
                                size: 16.sp,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              SizedBox(width: 8.w),
                              Expanded(
                                child: Text(
                                  widget.teacher.email,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                      ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4.h),

                          // Telefon bilgisi
                          Row(
                            children: [
                              Icon(
                                Icons.phone_outlined,
                                size: 16.sp,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                widget.teacher.phone,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),

                  // Sağ taraftaki ikonlar - resimle aynı hizada
                  Column(
                    children: [
                      Consumer<TeachersProvider>(
                        builder: (context, provider, child) {
                          final isFavorite =
                              provider.isFavorite(widget.teacher.id);
                          return IconButton(
                            onPressed: () {
                              provider.toggleFavorite(widget.teacher);
                              _showSnackBar(context, isFavorite);
                            },
                            icon: Icon(
                              isFavorite
                                  ? Icons.bookmark
                                  : Icons.bookmark_border,
                              color: Theme.of(context).colorScheme.secondary,
                              size: 24.sp,
                            ),
                          );
                        },
                      ),
                      IconButton(
                        onPressed: () {
                          // Paylaşım fonksiyonu
                        },
                        icon: Icon(
                          Icons.share_outlined,
                          color: Theme.of(context).colorScheme.secondary,
                          size: 24.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 12.h),

              // Ana branş ve yan branşlar yan yana
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Ana branş
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ana Branş",
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          widget.teacher.subject,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 16.w),

                  // Yan branşlar
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Yan Branşlar",
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        SizedBox(height: 4.h),
                        Wrap(
                          spacing: 4.w,
                          runSpacing: 2.h,
                          children: [
                            ...widget.teacher.secondarySubjects
                                .take(showAllSubjects
                                    ? widget.teacher.secondarySubjects.length
                                    : 3)
                                .map((subject) => Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 8.w,
                                        vertical: 4.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                      ),
                                      child: Text(
                                        subject,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                              fontSize: 12.sp,
                                            ),
                                      ),
                                    )),
                            if (widget.teacher.secondarySubjects.length > 3 &&
                                !showAllSubjects)
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showAllSubjects = true;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.w,
                                    vertical: 4.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(8.r),
                                    border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      width: 1,
                                    ),
                                  ),
                                  child: Text(
                                    "+${widget.teacher.secondarySubjects.length - 3}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                            if (showAllSubjects)
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showAllSubjects = false;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.w,
                                    vertical: 4.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(8.r),
                                    border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      width: 1,
                                    ),
                                  ),
                                  child: Text(
                                    "Daha az",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, bool wasFavorite) {
    final provider = Provider.of<TeachersProvider>(context, listen: false);
    final isNowFavorite = provider.isFavorite(widget.teacher.id);

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
        duration: const Duration(seconds: 2),
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
}
