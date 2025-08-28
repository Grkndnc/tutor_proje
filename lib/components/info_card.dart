import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyInfoCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData? icon;

  // ignore: prefer_const_constructors_in_immutables
  MyInfoCard({
    super.key,
    required this.title,
    required this.icon,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surface,
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).colorScheme.secondary),
        title: Text(title, style: Theme.of(context).textTheme.titleMedium),
        subtitle: Text(value, style: Theme.of(context).textTheme.bodyMedium),
      ),
    );
  }
}
