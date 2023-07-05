import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:singing_logining/modescreen/adminscreen.dart';

import 'loginScreen.dart';
import 'modescreen/studentscreen.dart';
import 'modescreen/teacherScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    isLogin();
    super.initState();

  }
  void isLogin() async{
    SharedPreferences sp =await SharedPreferences.getInstance();
   // bool isLogin = sp.getBool("mode") ?? false;
    String userType = sp.getString("mode") ?? '';


      if(userType == 'Student'){
        Timer(Duration(seconds: 5),(){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => StudentScreen()));
        });
      }else if(userType == 'Teacher'){
        Timer(Duration(seconds: 5),(){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => TeacherScreen()));
        });
      }
      else if(userType == 'Admin'){
        Timer(Duration(seconds: 5),(){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AdminScreen()));
        });
      }else{
        Timer(Duration(seconds: 5),(){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => LoginScreen()));
        });
      }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
          "images/pic-04.jpg",
        height: double.infinity,
        fit: BoxFit.fitHeight,
      ),

    );
  }
}
