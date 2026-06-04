import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:whats_app_clone/widgets/assets.dart';
import 'package:whats_app_clone/widgets/ui_helper.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          // padding: EdgeInsets.all(10),
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 33.h,
                  backgroundImage: AssetImage(Assets.chatimage1),
                ),

                Gap(15.w),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UiHelper.customText(
                        text: "Aron Gonjalbis",
                        height: 0,
                        maxLine: 1,
                        size: 16.sp,
                        color: Colors.black,
                        fontwght: FontWeight.w700,
                      ),

                      UiHelper.customText(
                        text: "I am here in Maitidevi where are now.",
                        height: 0,
                        maxLine: 2,
                        size: 15.sp,
                        fontwght: FontWeight.w400,
                      ),
                    ],
                  ),
                ),
                Gap(10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    UiHelper.customText(
                      text: "5:27 am",
                      height: 0,
                      size: 15.sp,
                      maxLine: 1,
                      fontwght: FontWeight.w700,
                      color: const Color(0xFF036A01),
                    ),
                    Gap(5.h),
                    CircleAvatar(
                      backgroundColor: const Color(0xFF036A01),
                      radius: 16.h,
                      child: UiHelper.customText(
                        text: "8",
                        height: 0,
                        size: 14.sp,
                        color: Colors.white,
                        fontwght: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
