 import 'package:final_fitnessapp/password_box.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passToggle = true;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        color: Colors.white, //Color.fromRGBO(32, 14, 50, 1),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Image.asset("assets/images/r1.png", height: 300),
                ),
                SizedBox(
                  height: 10,
                ),

                InputBox(
                  icon: Icon(Icons.person),
                  text: "Enter UserName",
                ),
                PasswordBox(),
                SizedBox(
                  height: 15,
                ),
                LoginButton(
                  onTap: () {},
                  buttonText: "Login",
                  rota: '/navbar',
                ),
                SizedBox(
                  height: 20,
                ),
                //Yeni Hesap oluşturmaya yonlendırme
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have any account?",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.restorablePushNamed(context, '/signup'),
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          color: Color.fromRGBO(130, 9, 230, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

