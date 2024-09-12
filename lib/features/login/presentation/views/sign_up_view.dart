import 'package:flutter/material.dart';
import 'package:login/features/login/presentation/views/widgets/signup_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      body: SignupViewBody() ,
    )
    ;
  }
}