import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whats_app_clone/widgets/assets.dart';

import '../widgets/ui_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 5.h, color: Colors.white),
            ),
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                child: Icon(
                  Icons.camera_alt_outlined,
                  size: 25.h,
                  color: Colors.white,
                ),
              ),
              Tab(
                child: UiHelper.customText(
                  text: "Chats",
                  height: 0,
                  size: 16.sp,
                  color: Colors.white,
                  fontwght: FontWeight.w700,
                ),
              ),
              Tab(
                child: UiHelper.customText(
                  text: "Status",
                  height: 0,
                  size: 16.sp,
                  color: Colors.white,
                  fontwght: FontWeight.w700,
                ),
              ),
              Tab(
                child: UiHelper.customText(
                  text: "Calls",
                  height: 0,
                  size: 16.sp,
                  color: Colors.white,
                  fontwght: FontWeight.w700,
                ),
              ),
            ],
          ),
          title: Row(
            children: [
              UiHelper.customText(
                text: "WhatsApp",
                height: 0,
                size: 25.h,
                color: Colors.white,
                fontwght: FontWeight.w700,
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search, size: 35.h, color: Colors.white),
              ),
            ],
          ),
          backgroundColor: Colors.teal,
          toolbarHeight: 125.h,
        ),
        body: Assets.screens[selectedIndex],
      ),
    );
  }
}
