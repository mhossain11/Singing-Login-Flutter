import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:singing_logining/component/buttoncomp.dart';
import 'package:singing_logining/loginScreen.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
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
        title: const Text('Student Screen'),
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
                const Text('Email:'),
                Text(email.toString())
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Mode:'),
                Text(mode.toString())
              ],
            ),
            SizedBox(height: 40,),

             ButtonComponent(name: 'Student Logout', onTab: (){
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
