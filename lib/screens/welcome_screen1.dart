import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:whats_app_clone/screens/welcome_screen2.dart';
import 'package:whats_app_clone/widgets/assets.dart';
import 'package:whats_app_clone/widgets/ui_helper.dart';

class WelcomeScreen1 extends StatelessWidget {
  const WelcomeScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Gap(100.h),

            Image.asset(
              Assets.image1,
              height: 250.h,
              width: 250.w,
              fit: BoxFit.cover,
            ),

            Gap(50.h),

            UiHelper.customText(
              text: "Welcome to WhatsApp",
              height: 0,
              size: 20.sp,
              fontwght: FontWeight.w400,
            ),

            Gap(25.h),

            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "Read out ",
                style: TextStyle(
                  height: 1.8.h,
                  color: Color(0xFF5E5E5E),
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                ),
                children: [
                  TextSpan(
                    text: "Privacy Policy.",
                    style: TextStyle(color: Color(0XFF0C42CC)),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print('Privacy and policy');
                      },
                  ),
                  TextSpan(text: ' Tap "Agree and Continue"\n'),
                  TextSpan(text: 'to accept the '),
                  TextSpan(
                    text: 'Terms of Services',
                    style: TextStyle(color: Color(0XFF0C42CC)),
                  ),
                ],
              ),
            ),

            Spacer(),

            UiHelper.customButton(
              btnName: "Agree and continue",
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen2()),
                );
              },
            ),

            Gap(20.h),
          ],
        ),
      ),
    );
  }
}
