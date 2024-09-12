import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({super.key, this.hintText,this.onchange});
  final String? hintText;
  final Function(String)? onchange;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      validator: (value) {
        if (value!.isEmpty){
          return 'field is requarid';
        }
      } ,
      onChanged: onchange,
            cursorColor: Colors.blue,            
            decoration: InputDecoration(
              hintText: hintText,       
              hintStyle: const TextStyle(color: Color.fromARGB(255, 158, 158, 158),fontSize: 15,fontWeight: FontWeight.w400),            
       
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color:  Color.fromARGB(255, 158, 158, 158)
              )) ,
              focusedBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color:  Colors.blue,
              )),
                         
            ),
                       );
  }
}