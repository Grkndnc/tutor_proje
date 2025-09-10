import 'package:flutter/material.dart';

class TeacherHomePage extends StatelessWidget {
  const TeacherHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("TeacherPage"),
      ),
      body: Center(
        child: GestureDetector(
          onDoubleTap: () {
            Navigator.of(context).pushNamed("/HomePage");
          },
          child: Container(
            height: 100,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.amberAccent,
            ),
            child: Center(child: Text("Öğrenci sayfasına ilerle ")),
          ),
        ),
      ),
    );
  }
}
