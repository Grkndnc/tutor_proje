import 'package:flutter/material.dart';
import 'package:tutorapp_deneme/components/info_card.dart';
import 'package:tutorapp_deneme/components/my_button.dart';

class TeacherProfilePage extends StatelessWidget {
  const TeacherProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil Sayfası"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          MyInfoCard(title: "Ödeme şekli", icon: Icons.money, value: "350"),
          MyButton(onPressed: () {}, text: "Devam et")
        ],
      ),
    );
  }
}
