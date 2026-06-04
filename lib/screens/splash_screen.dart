import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:whats_app_clone/screens/welcome_screen1.dart';
import 'package:whats_app_clone/widgets/assets.dart';
import 'package:whats_app_clone/widgets/ui_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    initilization();
    super.initState();
  }

  void initilization() {
    Future.delayed(Duration(seconds: 3), () async {
      await Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen1()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //what's app logo
            Image.asset(
              Assets.whatsappLogo,
              height: 83.h,
              width: 83.w,
              fit: BoxFit.cover,
            ),

            Gap(20.h),

            //what's app text
            UiHelper.customText(
              text: "WhatsApp",
              height: 0,
              size: 18.sp,
              fontwght: FontWeight.w700,
            ),
          ],
        ),
      ),
    );
  }
}
