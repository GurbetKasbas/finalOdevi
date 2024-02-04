import 'package:final_fitnessapp/password_box.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Container(
          //Farklı ekran boyutlarında widget'ın kendini ayarlamasını sağlar
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: 15),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed:() => Navigator.restorablePushNamed(context, '/navbar'),
                  child: Text(
                    "SKIP",
                    style: TextStyle(
                      color: Color.fromRGBO(172, 173, 255, 1),
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/images/r1.png", height: 350),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "MYFIT",
                style: TextStyle(
                  color: Color.fromRGBO(133, 135, 220, 1),
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  wordSpacing: 2,
                  letterSpacing: 4,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "This App will help you keep your body fit and strong",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 60),
      
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Login Butounu
                  Expanded(
                    child: LoginButton(
                      onTap: () {},
                      buttonText: "Login",
                      rota: '/login',
                    ),
                  ),
                  
                  SizedBox(width: 25,),
                  //Sign Up Butounu
                  Expanded(child: LoginButton(onTap: () {},buttonText: 'Sign Up', rota: '/signup',))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


