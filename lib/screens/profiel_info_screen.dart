import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:whats_app_clone/widgets/assets.dart';
import 'package:whats_app_clone/widgets/ui_helper.dart';

import 'home_screen.dart';

class ProfielInfoScreen extends StatefulWidget {
  const ProfielInfoScreen({super.key});

  @override
  State<ProfielInfoScreen> createState() => _ProfielInfoScreenState();
}

class _ProfielInfoScreenState extends State<ProfielInfoScreen> {
  String dropdownValue = Assets.list.first;
  String countryCodeValue = Assets.countryCode.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Gap(20.h),
              UiHelper.customText(
                text: "Profile info",
                height: 0,
                size: 18.sp,
                color: Color(0xFF00A884),
                fontwght: FontWeight.w700,
              ),

              Gap(40.h),

              UiHelper.customText(
                text: "Please provide your name and an optional",
                height: 1.8.h,
                size: 16.sp,
                fontwght: FontWeight.w400,
              ),
              UiHelper.customText(
                text: "profile photo",
                height: 1.8.h,
                size: 16.sp,
                fontwght: FontWeight.w400,
              ),

              Gap(40.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: userNberCnrtyCard(),
              ),

              Spacer(),

              UiHelper.customButton(
                btnName: "Next",
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
              ),
              Gap(20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget userNberCnrtyCard() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            print("Select profile picture");
          },
          child: Container(
            width: 158.w,
            height: 136.h,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.camera_alt, size: 50.sp, color: Colors.grey),
          ),
        ),
        Gap(40.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Type your name",
                  hintStyle: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w400,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF00A884)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF00A884)),
                  ),
                ),
              ),
            ),

            Gap(20.w),
            Image.asset(Assets.happyface, height: 30.h, width: 30.w),
          ],
        ),
      ],
    );
  }
}
