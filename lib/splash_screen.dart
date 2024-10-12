import 'dart:async';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:multi_roll_base_app/home_screen.dart';
import 'package:multi_roll_base_app/login_screen.dart';
import 'package:multi_roll_base_app/student_screen.dart';
import 'package:multi_roll_base_app/teacher_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    islogin();
  }

  void islogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool islogin = sp.getBool('islogin') ?? false;
    String usertype = sp.getString('usertype') ?? '';
    if (islogin) {
      if (usertype == 'student') {
        Timer(Duration(seconds: 4), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => StudentScreen()));
        });
      } else {
        Timer(Duration(seconds: 4), () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => TeacherScreen()));
        });
      }
    } else {
      Timer(Duration(seconds: 4), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Splash_Screen'),
      ),
      body: Center(child: Icon(Icons.adb_sharp)),
    );
  }
}
