import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Messsages",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox( height: 25,),
          Egitmenler(name: "Eğitmen Adı",avatar: AssetImage("assets/images/p1.jpg")),
          SizedBox( height: 25,),
          Egitmenler(name: "Eğitmen Adı",avatar: AssetImage("assets/images/p2.jpg"),),
          SizedBox( height: 25,),
          Egitmenler(name: "Eğitmen Adı",avatar: AssetImage("assets/images/p3.jpg")),
          SizedBox( height: 25,),
          Egitmenler(name: "Eğitmen Adı",avatar: AssetImage("assets/images/p4.jpg")),
          SizedBox( height: 25,),
          Egitmenler(name: "Eğitmen Adı",avatar: AssetImage("assets/images/p1.jpg")),
        ]),
      ),
    );
  }
}

class Egitmenler extends StatelessWidget {
  final String name;

  final ImageProvider<Object> avatar;

  const Egitmenler({super.key,required this.name,required this.avatar});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Color.fromRGBO(121, 172, 120, 1),
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                spreadRadius: 4, //Gölgenin yayılma miktarı
              ),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              avatar,
                          radius: 40,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          name,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 50,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                           call();
                          },
                          child:Icon(Icons.phone , size: 30 , color: Colors.black54), 
                        ),
                        
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                           sms();
                          },
                          child: Icon(Icons.message , size:30 , color: Colors.black54),)
                        
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
    
  }
  call() async {
    final Uri uri = Uri.parse("tel:+905528609999");
    launchUrl(uri);

  }
  sms() async {
    final Uri uri = Uri.parse("sms:+905528609999");
    launchUrl(uri);

  }
}
