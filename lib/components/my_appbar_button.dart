import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class MyAppBarButton extends StatelessWidget {
  Function()? onTap;
  IconData? icon;
  MyAppBarButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6.r),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 45.r,
          height: 45.r,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(
            icon,
            size: 28.r,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
