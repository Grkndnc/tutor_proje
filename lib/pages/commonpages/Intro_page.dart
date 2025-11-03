import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 25.sp),
              child: Column(
                children: [
                  Text(
                    "HocamBurda",
                    style: GoogleFonts.fredoka(
                        fontSize: 60.sp,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w400),
                  ),
                  Image.asset(
                    "images/Kids Studying from Home-bro.png",
                  ),
                ],
              ),
            ),
            Text(
              "Bilgiyle buluşmanın en hızlı, en güvenilir yolu.",
              style: GoogleFonts.oswald(fontSize: 18.sp, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Bir ders, bir öğretmen, bir adım: HocamBurda!",
              style: GoogleFonts.oswald(
                  fontSize: 18.sp,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 100.h),
            NewWidget(),
          ],
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Devam etmek için",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(
          width: 15.w,
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, "/LoginPage");
          },
          child: Padding(
            padding: EdgeInsets.only(top: 5.h),
            child: Text(
              "Tıklayınız",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: 15.sp),
            ),
          ),
        ),
      ],
    );
  }
}
