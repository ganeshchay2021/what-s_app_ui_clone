import 'package:flutter/material.dart';
import 'package:whats_app_clone/screens/tab%20screen/camera_screen.dart';

import '../screens/tab screen/calls_screen.dart';
import '../screens/tab screen/chats_screen.dart';
import '../screens/tab screen/status_screen.dart';

class Assets {
  static final String whatsappLogo = "assets/images/whatsapplogo.png";
  static final String image1 = "assets/images/image 1.png";
  static final String happyface = "assets/images/happyface.png";
  static final String chatimage1 = "assets/images/chatimage1.jpg";




  static final List<String> list = [
    'Nepal',
    'India',
    'USA',
    'UK',
    'Germany',
    'France',
  ];
  static final List<String> countryCode = [
    '+977',
    '+91',
    '+1',
    '+44',
    '+49',
    '+33',
  ];

  static final List<Widget> screens = [
    CameraScreen(),
    ChatsScreen(),
    StatusScreen(),
    CallsScreen(),
  ];
}
