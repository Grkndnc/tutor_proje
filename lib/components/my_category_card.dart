import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCategoryCard extends StatefulWidget {
  const MyCategoryCard({
    super.key,
    required this.myimage,
    required this.name,
  });
  final ImageProvider<Object> myimage;
  final String name;

  @override
  State<MyCategoryCard> createState() => _MyCategoryCardState();
}

class _MyCategoryCardState extends State<MyCategoryCard> {
  String? selectedRole;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              margin: EdgeInsets.all(7.r),
              width: 0.2.sw,
              height: 0.07.sh,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: widget.myimage,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedRole = "teacher";
                });
              },
              child: Container(
                width: 0.06.sw,
                height: 0.04.sh,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 4.w,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  shape: BoxShape.circle,
                  color: selectedRole == "teacher"
                      ? Theme.of(context).colorScheme.surface
                      : Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
        Text(widget.name,
            style: Theme.of(context).textTheme.headlineSmall),
      ],
    );
  }
}
