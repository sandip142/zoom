import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zoom/firebase_options.dart';
import 'package:zoom/resources/auth_method.dart';
import 'package:zoom/screens/home_screen.dart';
import 'package:zoom/screens/login.dart';
import 'package:zoom/screens/video_call_screen.dart';
import 'package:zoom/utils/color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme:ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: backgroundColor
      ),// ThemeData.dark().copyWith(
      //   scaffoldBackgroundColor: backgroundColor,
      // ),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/video-call': (context) => const VideoScreen(),
      },

      //stream builder is did the task whrere if user already login then automatically open homescreen else open default login screeen
      home:const SplaceScreen()
    );
  }
}

class SplaceScreen extends StatelessWidget {
  const SplaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash:Lottie.asset('assets/animation/Animation - 1709058041644.json'),
      nextScreen: StreamBuilder(
        stream: AuthMethod().authChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasData) {
            return const HomeScreen();
          }

          return const LoginScreen();
        },
      ),
      duration: 4000,
      splashTransition: SplashTransition.slideTransition,
      backgroundColor:backgroundColor,
      splashIconSize: 2000,
    );
  }
}
