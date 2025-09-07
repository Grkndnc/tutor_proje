import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: EdgeInsets.only(top: 0.08.sh, bottom: 0.08.sh),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Hoşgeldiniz",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(fontSize: 50),
            ),
            SizedBox(
              height: 50.h,
            ),
            Container(
              width: 0.8.sw,
              height: 0.5.sh,
              decoration: BoxDecoration(
                border: Border.all(
                    width: 3.w, color: Theme.of(context).colorScheme.secondary),
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("images/logo.png"), fit: BoxFit.contain),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Devam etmek için",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontSize: 24),
                ),
                SizedBox(
                  width: 15.w,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.headlineMedium,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/AuthPage");
                  },
                  child: Text(
                    "Tıklayınız",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontSize: 15),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
