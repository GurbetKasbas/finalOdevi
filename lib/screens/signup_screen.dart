import 'package:final_fitnessapp/password_box.dart';


import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});





  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,//Color.fromRGBO(32, 14, 50, 1),
      child: SingleChildScrollView(
        child: SafeArea(child: Column(
          children: [
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/images/r1.png" , height: 250,),
            ),
            InputBox(text: "Full Name", icon: Icon(Icons.person)),
            InputBox(text: "Email Adress", icon: Icon(Icons.email)),
            InputBox(text: "Phone Number", icon: Icon(Icons.phone)),
            PasswordBox(),
            SizedBox(
              height: 20,
            ),
            LoginButton(onTap: () {},buttonText: "Create Account", rota: '/navbar'),

            SizedBox(
              height: 20,
            ),
            //Yeni Hesap oluşturmaya yonlendırme
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have account?",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
                TextButton(
                  onPressed:() => Navigator.restorablePushNamed(context, '/login'),
                  child: Text(
                    "Log In",
                    style: TextStyle(
                      color: Color.fromRGBO(130, 9, 230,1),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}


