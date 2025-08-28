import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tutorapp_deneme/components/my_list_tile.dart';
import 'package:tutorapp_deneme/providers/teachers_provider.dart';

class MyEndDrawer extends StatelessWidget {
  const MyEndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      //backgroundColor: Theme.of(context).colorScheme.primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide.none),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(30).r,
                      child: Column(
                        children: [
                          Text(
                            "Hoşgeldin !",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text(
                            "Gürkan DİNÇ",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      radius: 30.r,
                      backgroundImage:
                          AssetImage("images/quantum-computer_12608409.png"),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              MyListTile(
                text: 'Profilim',
                icon: Icons.account_circle,
                onTap: () => Navigator.pop(context),
              ),
              MyListTile(
                text: 'Derslerim',
                icon: Icons.cast_for_education_rounded,
                onTap: () {},
              ),
              Consumer<TeachersProvider>(
                builder: (context, provider, child) {
                  return MyListTile(
                    text: 'Favori Öğretmenlerim',
                    icon: Icons.bookmark_border_rounded,
                    badgeCount: provider.favoriteCount,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/my-favorite-teachers');
                    },
                  );
                },
              ),
            ],
          ),
          MyListTile(
              text: 'Log Out',
              icon: Icons.logout,
              onTap: () {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Çıkış"),
                        backgroundColor: Colors.white,
                        content: Text(
                          "Çıkış Yapmak İstediğinizden Emin Misiniz ?",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        actions: [
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      '/IntroPage',
                                      (route) => false,
                                    );
                                  },
                                  child: Text(
                                    "Evet",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "İptal",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    });
              }),
        ],
      ),
    );
  }
}
