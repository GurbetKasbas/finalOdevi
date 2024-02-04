import 'package:flutter/material.dart';

class PasswordBox extends StatefulWidget {
  const PasswordBox({super.key});

  @override
  State<PasswordBox> createState() => _PasswordBoxState();
}

class _PasswordBoxState extends State<PasswordBox> {
  bool passToggle = true;
 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      child: TextField(
        
        obscureText: passToggle ? true : false, //Şifreyi gizler
        decoration: InputDecoration(
          label: Text("Password"),
          prefixIcon: Icon(Icons.lock),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
          filled: true, //Arka plan dolu olsun mu
          fillColor: Color.fromARGB(63, 177, 1, 230),
          //Göz işaretinin üzerine tıklandığında  şifre görünür
          suffixIcon: InkWell(
            onTap: () {
              setState(() {
                passToggle = !passToggle;
              });
            },
            child: passToggle
                ? Icon(Icons.visibility_off)
                : Icon(Icons.visibility),
          ),
        ),
      ),
    );
  }
}

class InputBox extends StatelessWidget {
  final String text;
  final Icon icon;
  
  
  InputBox({super.key, required this.text, required this.icon ,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      child: TextField(
        
        decoration: InputDecoration(
            label: Text(text),
            prefixIcon: icon,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
            filled: true, //Arka plan dolu olsun mu
            fillColor: Color.fromARGB(63, 177, 1, 230) //Arka plan rengi
            ),
      ),
    );
  }
}

//Birden fazla kez lullandığımız butonu widget haline getirip ozellıklerı değişken ile tuttuk
//Butonu Çağırma Fonksiyonu
class LoginButton extends StatelessWidget {
  final String buttonText;
  final String rota;
  final VoidCallback onTap;

// Constructor aracılığıyla değeri alıyoruz
  const LoginButton(
      {Key? key,
      required this.buttonText,
      required this.rota,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      //Butona tıklandığında belirtilen sayfa gonderir
      onPressed: () => Navigator.pushNamed(context, rota),
      style: ElevatedButton.styleFrom(
        primary: Color.fromRGBO(172, 173, 255, 1), // Buton rengi
        onPrimary: Colors.white, // Buton metni rengi

        padding: EdgeInsets.symmetric(horizontal: 35, vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      child: Text(buttonText),
    );
  }
}
