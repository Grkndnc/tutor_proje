import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  MyButton({super.key, required this.onPressed, required this.text});

  void Function()? onPressed;
  String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                width: 2.w, color: Theme.of(context).colorScheme.surface),
            borderRadius: BorderRadius.circular(15.r),
            color: Theme.of(context).colorScheme.inversePrimary),
        height: 0.06.sh,
        width: 0.7.sw,
        child: Padding(
          padding: EdgeInsets.only(top: 10.r),
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
