import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:zoom/resources/auth_method.dart';
import 'package:zoom/utils/color.dart';
import 'package:zoom/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _authmethod = AuthMethod();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor , //Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Start or Join a Meeting',
            style:GoogleFonts.eagleLake (
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color:Colors.green
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(38.0),
            child: Lottie.asset('assets/animation/Animation - 1709064438865.json')
          ),
          CustomButton(
            text: 'Login With Google',
            ontap: () async {
              bool res = await _authmethod.signInWithGoogle(context);
              if (res) {
                Navigator.pushNamed(context, '/home');
              }
            },
          ),
        ],
      ),
    );
  }
}
