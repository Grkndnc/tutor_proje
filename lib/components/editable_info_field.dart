import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditableInfoField extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final TextEditingController controller;
  final bool isEditing;
  final TextInputType? keyboardType;
  final int? maxLines;

  const EditableInfoField({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.controller,
    required this.isEditing,
    this.keyboardType,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Theme.of(context).colorScheme.surface,
          border: Border.all(
            color: isEditing
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.outline,
            width: isEditing ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Theme.of(context).colorScheme.secondary,
              size: 24.sp,
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                  ),
                  SizedBox(height: 6.h),
                  if (isEditing)
                    TextField(
                      controller: controller,
                      keyboardType: keyboardType,
                      maxLines: maxLines ?? 1,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                        isDense: true,
                        hintStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    )
                  else
                    Text(
                      value,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
