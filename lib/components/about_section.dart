import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class AboutSection extends StatelessWidget {
  final String? aboutText;
  final TextEditingController aboutController;
  final bool editMode;
  const AboutSection(
      {super.key,
      required this.editMode,
      required this.aboutController,
      this.aboutText});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final placeholder = 'Hakkınızda kısa bilgi yazınız';
    final displaytext = (aboutText ?? "").trim();
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(28.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Icon(
                    CupertinoIcons.person_crop_circle_fill,
                    size: 24.sp,
                    color: theme.colorScheme.secondary,
                  ),
                ),
                SizedBox(width: 14.w),
                if (aboutText == null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hakkımda',
                        style: theme.textTheme.displayMedium,
                      ),
                      SizedBox(height: 4.h),
                      Text('Öğrencileriniz için kısa bir tanıtım ekleyin',
                          style: theme.textTheme.titleSmall),
                    ],
                  )
                else
                  Text(
                    'Hakkımda',
                    style: theme.textTheme.displayMedium,
                  ),
              ],
            ),
            SizedBox(height: 16.h),
            editMode
                ? Container(
                    constraints: BoxConstraints(
                      minHeight: 100.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18.r),
                    ),
                    child: TextField(
                      controller: aboutController,
                      minLines: 3,
                      maxLines: null,
                      style: theme.textTheme.bodyMedium,
                      decoration: InputDecoration(
                        hintText: placeholder,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.r),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.r),
                          borderSide: BorderSide(
                              color: theme.colorScheme.secondary, width: 1.2),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 18.h),
                      ),
                    ),
                  )
                : Container(
                    constraints: BoxConstraints(minHeight: 100.h),
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18.r),
                    ),
                    child: Text(
                      displaytext.isEmpty ? placeholder : displaytext,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
