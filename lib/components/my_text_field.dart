import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class Mytextfield extends StatelessWidget {
  final String labelText;
  final String hintText;
  Widget? suffixIcon;
  TextEditingController? controller;
  final bool obscureText;
  Mytextfield(
      {super.key,
      this.obscureText = false,
      this.controller,
      required this.labelText,
      required this.hintText,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        cursorColor: Theme.of(context).colorScheme.secondary,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.secondary, width: 2),
          ),
          suffixIcon: suffixIcon,
          labelStyle:
              Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 18),
          labelText: labelText,
          fillColor: Theme.of(context).colorScheme.inversePrimary,
          filled: true,
          hintText: hintText,
          hintStyle:
              Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 18),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.surface, width: 2),
          ),
        ),
      ),
    );
  }
}
