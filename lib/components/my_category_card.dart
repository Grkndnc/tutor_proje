import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCategoryCard extends StatefulWidget {
  const MyCategoryCard({
    super.key,
    required this.myimage,
    required this.name,
    this.isSelected = false,
    this.onTap,
  });
  final ImageProvider<Object> myimage;
  final String name;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  State<MyCategoryCard> createState() => _MyCategoryCardState();
}

class _MyCategoryCardState extends State<MyCategoryCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
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
              // Seçim göstergesi - boş daire veya tik ikonu
              Container(
                width: 0.06.sw,
                height: 0.04.sh,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2.w,
                    color: widget.isSelected
                        ? Colors.white
                        : Theme.of(context).colorScheme.secondary,
                  ),
                  shape: BoxShape.circle,
                  color: widget.isSelected
                      ? Theme.of(context).colorScheme.secondary
                      : Colors.transparent,
                ),
                child: widget.isSelected
                    ? Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 16.sp,
                      )
                    : null,
              ),
            ],
          ),
          Text(
            widget.name,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: widget.isSelected
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.onSurface,
                  fontWeight:
                      widget.isSelected ? FontWeight.bold : FontWeight.normal,
                ),
          ),
        ],
      ),
    );
  }
}
