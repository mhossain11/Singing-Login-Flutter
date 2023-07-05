import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:singing_logining/component/buttoncomp.dart';

import '../loginScreen.dart';

class TeacherScreen extends StatefulWidget {
  const TeacherScreen({super.key});

  @override
  State<TeacherScreen> createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {
  String email="",mode="";

  initState(){
    loadData();
  }
  loadData()async{
    SharedPreferences sp =await SharedPreferences.getInstance();
    email= sp.getString('email')??'';
    mode = sp.getString('mode')??'';
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher Screen'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Email:'),
                Text(email.toString())
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Mode:'),
                Text(mode.toString())
              ],
            ),
            SizedBox(height: 40,),

            ButtonComponent(name: "Teacher Logout", onTab: (){
              setState(() async {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.clear();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));

              });

            })
          ],
        ),
      ),
    );
  }
}
