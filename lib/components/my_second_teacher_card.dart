import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tutorapp_deneme/models/teacher.dart';
import 'package:tutorapp_deneme/providers/teachers_provider.dart';

class MySecondTeacherCard extends StatefulWidget {
  final Teacher teacher;
  final VoidCallback? onTap;
  final bool showContactInfo;
  final bool showIcons;
  final bool editmode;
  final VoidCallback? onToggleContact;

  const MySecondTeacherCard({
    super.key,
    required this.teacher,
    this.onToggleContact,
    this.editmode = true,
    this.showIcons = true,
    this.onTap,
    this.showContactInfo = true,
  });

  @override
  State<MySecondTeacherCard> createState() => _MySecondTeacherCardState();
}

class _MySecondTeacherCardState extends State<MySecondTeacherCard> {
  bool showAllSubjects = false;

  late List<String> localSecondarySubjects;

  @override
  void initState() {
    super.initState();
    localSecondarySubjects = widget.teacher.secondarySubjects != null
        ? List.from(widget.teacher.secondarySubjects!)
        : [];
  }

  void _addSubject(String subject) {
    if (!localSecondarySubjects.contains(subject)) {
      setState(() {
        localSecondarySubjects.add(subject);
      });
      saveProvider();
    }
  }

  void _removeSubject(String subject) {
    if (localSecondarySubjects.contains(subject)) {
      setState(() {
        localSecondarySubjects.remove(subject);
      });
      saveProvider();
    }
  }

//
  void saveProvider() {
    context
        .read<TeachersProvider>()
        .updateTeacherDetails(secondarySubjects: localSecondarySubjects);
  }

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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50.r,
                    backgroundColor: Colors.blueGrey.shade400,
                    child: CircleAvatar(
                      radius: 48.r,
                      backgroundImage: AssetImage(
                          widget.teacher.image ?? "images/defaultuser.jpg"),
                    ),
                  ),
                  SizedBox(width: 12.w),

                  // İsim ve iletişim bilgileri
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.teacher.fullName,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        SizedBox(height: 8.h),

                        // Email bilgisi ---editmode

                        Row(
                          children: [
                            Icon(
                              Icons.email_outlined,
                              size: 16.sp,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              widget.teacher.email,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        // telefon bilgisi -- editmode -- gizle goster

                        Row(
                          children: [
                            if (widget.editmode)
                              GestureDetector(
                                onTap: widget.onToggleContact,
                                child: Icon(
                                  widget.showContactInfo
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  size: 16.sp,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              )
                            else if (widget.showContactInfo)
                              Icon(
                                Icons.phone_outlined,
                                size: 16.sp,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            SizedBox(width: 8.w),
                            if (widget.showContactInfo)
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
                              )
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Sağ taraftaki ikonlar - resimle aynı hizada ////gizle---göster//
                  if (widget.showIcons)
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
                    )
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

                  // ////////.  Yan branşlar bölümü
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Yan Branşlar",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                            if (widget.editmode)
                              GestureDetector(
                                child: Icon(
                                  CupertinoIcons.add_circled_solid,
                                  size: 19.sp,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                                onTap: () async {
                                  final allSubjects = [
                                    "Matematik",
                                    'Fizik',
                                    'Kimya',
                                    'Biyoloji',
                                    'Tarih',
                                    'Coğrafya',
                                    'İngilizce',
                                    "Türkçe"
                                  ];

                                  final selected = await showDialog<String>(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Center(
                                          child: Text(
                                            "Lütfen Branş Seçiniz",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium,
                                          ),
                                        ),
                                        content: SizedBox(
                                          width: double.maxFinite,
                                          child: SingleChildScrollView(
                                            child: Wrap(
                                              spacing: 8.w,
                                              runSpacing: 8.h,
                                              children:
                                                  allSubjects.map((subject) {
                                                final isAdded =
                                                    localSecondarySubjects
                                                        .contains(subject);
                                                return GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(
                                                        context, subject);
                                                  },
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 12.w,
                                                            vertical: 8.h),
                                                    decoration: BoxDecoration(
                                                      color: isAdded
                                                          ? Colors
                                                              .green.shade100
                                                          : Colors.blue.shade50,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.r),
                                                      border: Border.all(
                                                        color: isAdded
                                                            ? Colors
                                                                .green.shade400
                                                            : Colors
                                                                .blue.shade200,
                                                        width: 1,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Text(
                                                          subject,
                                                          style: TextStyle(
                                                            fontSize: 14.sp,
                                                            color: isAdded
                                                                ? Colors.green
                                                                    .shade900
                                                                : Colors.blue
                                                                    .shade900,
                                                          ),
                                                        ),
                                                        SizedBox(width: 4.w),
                                                        Icon(
                                                          isAdded
                                                              ? Icons
                                                                  .check_circle
                                                              : Icons
                                                                  .circle_outlined,
                                                          size: 16.sp,
                                                          color: isAdded
                                                              ? Colors.green
                                                                  .shade400
                                                              : Colors.blue
                                                                  .shade400,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );

                                  if (selected != null &&
                                      !localSecondarySubjects
                                          .contains(selected)) {
                                    _addSubject(selected);
                                  }
                                },
                              ),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        ///// DERSLERİ GÖSTERMEK YAN BRANŞLARIN ALTI///////
                        Builder(
                          builder: (context) {
                            final subjects = localSecondarySubjects;
                            return Padding(
                              padding: EdgeInsets.only(top: 5.r),
                              child: Wrap(
                                alignment: WrapAlignment.start,
                                spacing: 4.w,
                                runSpacing: 2.h,
                                children: [
                                  ...subjects
                                      .take(
                                          showAllSubjects ? subjects.length : 3)
                                      .map(
                                        (subject) => Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 8.w,
                                            vertical: 4.h,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
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
                                              if (widget.editmode)
                                                GestureDetector(
                                                  onTap: () =>
                                                      _removeSubject(subject),
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 4.w),
                                                    child: Icon(
                                                      Icons.close,
                                                      size: 15.sp,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                  ////+ göster butonu ////////
                                  if (subjects.length > 3 && !showAllSubjects)
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
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                          border: Border.all(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            width: 1,
                                          ),
                                        ),
                                        child: Text(
                                          "+${subjects.length - 3}",
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
                                  ////// Daha az göster butonu////////////
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
                                          borderRadius:
                                              BorderRadius.circular(8.r),
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
                            );
                          },
                        ),
                      ],
                    ),
                  )
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
