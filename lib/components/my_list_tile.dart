import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? onTap;
  final int? badgeCount; // Badge sayısı için yeni parametre

  // ignore: prefer_const_constructors_in_immutables
  MyListTile({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
    this.badgeCount, // Badge sayısı opsiyonel
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
      ),
      child: ListTile(
        leading: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, right: 8),
              child: Icon(
                icon,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            if (badgeCount != null && badgeCount! > 0)
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 15,
                    minHeight: 12,
                  ),
                  child: Text(
                    badgeCount.toString(),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
        title: Text(
          text,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        onTap: onTap,
      ),
    );
  }
}
