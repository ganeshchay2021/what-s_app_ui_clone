import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:whats_app_clone/screens/profiel_info_screen.dart';

import '../widgets/ui_helper.dart';

class VerifyPhonmnbrScreen extends StatefulWidget {
  const VerifyPhonmnbrScreen({super.key});

  @override
  State<VerifyPhonmnbrScreen> createState() => _VerifyPhonmnbrScreenState();
}

class _VerifyPhonmnbrScreenState extends State<VerifyPhonmnbrScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final List<FocusNode> focusNode = List.generate(6, (index) => FocusNode());
  final List<TextEditingController> controller = List.generate(
    6,
    (index) => TextEditingController(),
  );

  @override
  void dispose() {
    for (var controller in controller) {
      controller.dispose();
    }
    for (var node in focusNode) {
      node.dispose();
    }
    super.dispose();
  }

  // Automatically manages cursor jumping between numeric blocks
  void _onOtpChanged(String value, int index) {
    if (value.length == 1 && index < 5) {
      focusNode[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      focusNode[index - 1].requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                Gap(20.h),
                UiHelper.customText(
                  text: "Verifying your number",
                  height: 0,
                  size: 18.sp,
                  color: Color(0xFF00A884),
                  fontwght: FontWeight.w700,
                ),

                Gap(40.h),

                UiHelper.customText(
                  text: "You’ve tried to register +977-9807706458",
                  height: 1.8.h,
                  size: 15.sp,
                  fontwght: FontWeight.w400,
                ),
                UiHelper.customText(
                  text: "recently. Wait before requesting an sms or a call",
                  height: 1.8.h,
                  size: 15.sp,
                  fontwght: FontWeight.w400,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UiHelper.customText(
                      text: " with your code. ",
                      height: 1.8.h,
                      size: 15.sp,
                      fontwght: FontWeight.w400,
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(20),

                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          print("Wriong Number");
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: UiHelper.customText(
                            text: "Wrong number?",
                            height: 1.8.h,
                            size: 15.sp,
                            color: Color(0xFF00A884),
                            fontwght: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Gap(40.h),

                Form(
                  key: _formKey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(6, (index) {
                      return SizedBox(
                        width: 45,
                        height: 50,
                        child: TextFormField(
                          controller: controller[index],
                          focusNode: focusNode[index],
                          maxLength: 1,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,

                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            counterText: "", // Hides length indicator label
                            fillColor: Color(0XFFD9D9D9),
                            filled: true,
                            contentPadding: EdgeInsets.zero,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          onChanged: (value) => _onOtpChanged(value, index),
                        ),
                      );
                    }),
                  ),
                ),

                Gap(40.h),

                Material(
                  borderRadius: BorderRadius.circular(20),

                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      print("Didn’t receive code?");
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: UiHelper.customText(
                        text: "Didn’t receive code?",
                        height: 1.8.h,
                        size: 16.sp,
                        color: Color(0xFF00A884),
                        fontwght: FontWeight.w400,
                      ),
                    ),
                  ),
                ),

                Spacer(),

                UiHelper.customButton(
                  btnName: "Next",
                  onPressed: () {
                    String otp = controller.map((e) => e.text).join();
                    debugPrint("Entered OTP: $otp");

                    if (otp.length == 6) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfielInfoScreen(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          dismissDirection: DismissDirection.horizontal,
                          backgroundColor: Colors.redAccent,
                          action: SnackBarAction(
                            label: "Close",
                            textColor: Colors.white,
                            onPressed: () {
                              ScaffoldMessenger.of(
                                context,
                              ).hideCurrentSnackBar();
                            },
                          ),

                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Error",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("Please enter a valid 6-digit OTP"),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                ),
                Gap(20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
