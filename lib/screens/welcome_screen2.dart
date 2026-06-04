import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:whats_app_clone/screens/verify_phonmnbr_screen.dart';
import 'package:whats_app_clone/widgets/assets.dart';
import 'package:whats_app_clone/widgets/ui_helper.dart';

class WelcomeScreen2 extends StatefulWidget {
  const WelcomeScreen2({super.key});

  @override
  State<WelcomeScreen2> createState() => _WelcomeScreen2State();
}

class _WelcomeScreen2State extends State<WelcomeScreen2> {
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
                text: "Enter your phone number",
                height: 0,
                size: 18.sp,
                color: Color(0xFF00A884),
                fontwght: FontWeight.w700,
              ),

              Gap(40.h),

              UiHelper.customText(
                text: "WhatsApp will need to verify your phone",
                height: 1.8.h,
                size: 16.sp,
                fontwght: FontWeight.w400,
              ),
              UiHelper.customText(
                text: "number. Carrier charges may apply.",
                height: 1.8.h,
                size: 16.sp,
                fontwght: FontWeight.w400,
              ),
              UiHelper.customText(
                text: " What’s my number?",
                height: 1.8.h,
                size: 16.sp,
                color: Color(0xFF00A884),
                fontwght: FontWeight.w400,
              ),

              Gap(20.h),

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
                    MaterialPageRoute(
                      builder: (context) => VerifyPhonmnbrScreen(),
                    ),
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
        UiHelper.dropDownBtn(
          widget: Icon(Icons.arrow_drop_down, size: 40.sp, color: Colors.black),
          dropdownInitialValue: dropdownValue,
          list: Assets.list,
          onChange: (value) {
            setState(() {
              dropdownValue = value!;
            });
          },
        ),

        Gap(20.h),

        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            DropdownButtonHideUnderline(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.teal)),
                ),
                child: UiHelper.dropDownBtn(
                  width: 50.w,
                  widget: SizedBox(),
                  dropdownInitialValue: countryCodeValue,
                  list: Assets.countryCode,
                  onChange: (value) {
                    setState(() {
                      countryCodeValue = value!;
                    });
                  },
                ),
              ),
            ),

            Gap(20.w),

            Expanded(
              child: TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: "Phone number",
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
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
          ],
        ),
      ],
    );
  }
}
