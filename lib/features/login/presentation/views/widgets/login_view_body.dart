import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/features/login/presentation/views/sign_up_view.dart';
import 'package:login/features/login/presentation/views/widgets/custom_text_widget.dart';

class LoginViewBody extends StatelessWidget {
   LoginViewBody({super.key});
    String? emailAddress;
  String? password;
  GlobalKey<FormState> formkey=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:16.0),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Login',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  const SizedBox(height: 5,),
                  const Text('Welcome back to the app',style: TextStyle(color: Color.fromARGB(255, 134, 134, 134),fontSize: 16,fontWeight: FontWeight.w500),),
                  const SizedBox(height: 40,),
                  const Text('Email Address',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  const SizedBox(height: 5,),
                   CustomTextWidget(hintText: 'Your Email',
                  onchange: (data){
                      emailAddress=data;
                    },),
                   const SizedBox(height: 25,),
                   const Text('Password',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                   const SizedBox(height: 5,),
                    CustomTextWidget(hintText: 'Your Password',
                    onchange: (data){
                      password=data;
                    },),
                    const SizedBox(height: 40,),
                    Center(
                      child: ElevatedButton(
                        style:ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          minimumSize:   Size(MediaQuery.sizeOf(context).width*.9, 50),     
                        ),
                        onPressed: () async{
                          if (formkey.currentState!.validate()) {
        try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
          ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login successful!'),
          backgroundColor: Colors.green, 
          duration: Duration(seconds: 2),
        ),
      );
        } on FirebaseAuthException catch (e) {
      print('Login failed: ${e.message}');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid email or password.'),
          duration: Duration(seconds: 2),
        ),
      );
        }catch (e) {
              print(e);
              ScaffoldMessenger.of(context).showSnackBar(
                       SnackBar(
                        content: Text(e.toString()),
                        duration: Duration(seconds: 2), 
                      ),
                    );
            }
            
            
      }
                        }, child: 
                      const Text('Login',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w600),)),
                    ),
                    const SizedBox(height: 35,),
                   Center(child: 
                   GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder:(context){ return SignUpView();}
                      ));
                    },
                    child: const Text('Create an account',style: TextStyle(color: Colors.blue,fontSize: 16,fontWeight: FontWeight.bold),))),
            
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}