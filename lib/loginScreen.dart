import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:singing_logining/component/buttoncomp.dart';
import 'package:singing_logining/component/textsfields.dart';
import 'package:singing_logining/modescreen/adminscreen.dart';
import 'package:singing_logining/modescreen/studentscreen.dart';
import 'package:singing_logining/modescreen/teacherScreen.dart';

import 'component/passtextsfields.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey= GlobalKey<FormState>();
  final _passformKey= GlobalKey<FormState>();
  final emailController =TextEditingController();
 // final passwordController =TextEditingController();
  String dropdownValue ="Student";
  bool passToggle =true ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(child: Text("SignIng Screen",style: TextStyle(fontSize: 30),)),
          const SizedBox(height: 20,),
         TextsFields(emailText: 'Email',emailController: emailController,formKey: _formKey),
         const SizedBox(height: 15,),
         PassTextsFields(emailText: 'Password',/*emailController: passwordController*/
           onPress: () {
           setState(() {
            passToggle =!passToggle;
           });
           },passToggle: passToggle,formKey:_passformKey ),

          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             /* Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: const Text("Mode :",style: TextStyle(fontSize: 18),),
              ),
              const SizedBox(width: 10,),*/
              Container(
                padding: const EdgeInsets.all(5),
                width: 350,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButtonFormField(
                    value: dropdownValue,
                    icon:const Icon(Icons.arrow_drop_down_circle,color: Colors.blue,),
                    onChanged: (String ? Value){
                      setState(() {
                        dropdownValue = Value!;
                      });

                    },
                    decoration: const InputDecoration(
                      labelText: 'Mode',
                      border: UnderlineInputBorder()

                    ),
                   /* underline: Container(
                      height: 2,
                      color: Colors.blue,
                    ),*/
                    items:const [
                      DropdownMenuItem(
                          value: "Student",
                          child: Text('Student')),
                      DropdownMenuItem(
                          value: "Teacher",
                          child: Text('Teacher')),
                      DropdownMenuItem(
                          value: "Admin",
                          child: Text('Admin')),
                    ]
                ),
              ),
            ],
          ),


          const SizedBox(height: 30,),
          ButtonComponent(name: "Sign in", onTab: () async {
            SharedPreferences sp =await SharedPreferences.getInstance();
            sp.setString('email',emailController.text.toString());
            sp.setString('mode', dropdownValue);
              if(_formKey.currentState!.validate() && _passformKey.currentState!.validate()){
                mode();
              }
          }),
        ],
      ),
    );
  }
  void mode(){
    if(dropdownValue == 'Student'){
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => StudentScreen()));
    }else if(dropdownValue == 'Teacher'){
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => TeacherScreen()));
    }else if(dropdownValue == 'Admin'){
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => AdminScreen()));
    }

  }
}
