import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  String name="";
  VoidCallback onTab;
   ButtonComponent({ required this.name,required this.onTab});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
      child: InkWell(
        onTap: onTab,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10)
          ),

          child:  Center(child: Text(name)),

        ),
      ),
    );
  }
}

