import 'package:flutter/material.dart';

class MyShowDialog {
  static Future<void> show({
    required BuildContext context,
    required String title,
    required String content,
    required VoidCallback onConfirm,
    String? confirmText,
    String? cancelText,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          backgroundColor: Colors.white,
          content: Text(content),
          actions: [
            TextButton(
              onPressed: onConfirm,
              child: Text(
                confirmText ?? "",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                cancelText ?? "",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        );
      },
    );
  }
}
