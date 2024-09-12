import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/features/login/presentation/views/login_view.dart';
import 'package:login/features/login/presentation/views/widgets/custom_text_widget.dart';

class SignupViewBody extends StatelessWidget {
   SignupViewBody({super.key});
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
                  const Text('Create an account',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  const SizedBox(height: 40,),
                  const Text('Name',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  const SizedBox(height: 5,),
                  const CustomTextWidget(hintText: 'Your Name',),
                   const SizedBox(height: 25,),
                   const Text('Email Address',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 5,),
                    CustomTextWidget(
                    onchange: (data){
                      emailAddress=data;
                    },
                    hintText: 'Your Email',),
                   const SizedBox(height: 25,),
                   const Text('Password',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                   const SizedBox(height: 5,),
                    CustomTextWidget(
                    onchange: (data){
                      password=data;
                    },
                    hintText: 'Your Password',),
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
              final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: emailAddress!,
                password: password!,
              );
                  ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Sign up successful!'),
          backgroundColor: Colors.green, 
          duration: Duration(seconds: 2),
        ),
      );
            } on FirebaseAuthException catch (e) {
              if (e.code == 'weak-password') {
                print('The password provided is too weak.');
                 ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('The password provided is too weak.'),
                        duration: Duration(seconds: 2), 
                      ),
                    );
              } else if (e.code == 'email-already-in-use') {
                print('The account already exists for that email.');
                 ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('The account already exists for that email.'),
                        duration: Duration(seconds: 2), 
                      ),
                    );
              }
            } catch (e) {
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
                      const Text('Sign up',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w600),)),
                    ),
                    const SizedBox(height: 35,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account? ',style: TextStyle(color:  Color.fromARGB(255, 134, 134, 134),fontSize: 16,fontWeight: FontWeight.w500),),
                        Center(child: 
                   GestureDetector(
                    onTap: () {
                     
                      Navigator.push(context, MaterialPageRoute(builder:(context){ return LoginView();}
                      ));
                    },
                    child: const Text('log in here',style: TextStyle(color: Colors.blue,fontSize: 16,fontWeight: FontWeight.bold),))),
            
                      ],
                    )
                   
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}