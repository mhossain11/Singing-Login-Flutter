import 'package:flutter/material.dart';

class TextsFields extends StatelessWidget {
  String emailText='';
  TextEditingController emailController;
  String text=" ";
  GlobalKey<FormState> formKey ;


   TextsFields({required this.emailText,
     required this.emailController,required this.formKey
     });

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.all(10.0),
      child: Form(
        key: formKey,
        child: SizedBox(
          width: 350,
          height: 50,
          // height: MediaQuery.of(context).size.height,
         // width: MediaQuery.of(context).size.width,
          child: TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: emailText,
            ),
            validator: (value){
              if(value == null || value.isEmpty){
                return 'Please enter some text';
              }else{
                return null;
              }
            },
          ),
        ),
      ),
    );

  }

}
