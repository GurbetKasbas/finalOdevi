import 'package:final_fitnessapp/screens/home_screen.dart';
//import 'package:final_fitnessapp/screens/loading_screen.dart';
import 'package:final_fitnessapp/screens/login_screen.dart';
import 'package:final_fitnessapp/screens/navbar_roots.dart';
//import 'package:final_fitnessapp/screens/schedule_screen.dart';
import 'package:final_fitnessapp/screens/settings_screen.dart';

import 'package:final_fitnessapp/screens/signup_screen.dart';

import 'package:final_fitnessapp/screens/welcome_screen.dart';


import 'package:flutter/material.dart';

void main() {
  runApp(FitnessApp());
}

class FitnessApp extends StatelessWidget {
  const FitnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/login':(context) => LoginScreen(),
        '/signup':(context) => SignUpScreen(),
        '/home':(context) => HomeScreen(),
        '/navbar':(context) => NavbarRoots(),
        '/Settings':(context) => SettingsScreen(),
        //'/loading':(context) => LoadingScreen(),
     },
      // initialRoute: '/loading',
      
     //home: ScheduleScreen(),
   
       home: WelcomeScreen(),
    );
    
  }
}