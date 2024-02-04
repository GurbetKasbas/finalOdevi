import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class HomeScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,//Color.fromRGBO(113, 58, 190, 1),
      child: SingleChildScrollView(
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top:20 ,left:10,right: 10),
              
                width: double.infinity,
                height: 300,
                child: ClipOval(
                child: Image.asset(
                  "assets/images/s4.jpg",
                  fit: BoxFit.cover,
                ),
              ),
                
                ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Kutu(
                  onTap: () {
                    
                  },
                  backgroundColor: Color.fromRGBO(142, 143, 250,1),
                  image: AssetImage("assets/images/s4.jpg"),
                  title: "Tüm Vücut",
                ),
                Kutu(
                  onTap: () {
                    _launchYoutubeLink("https://youtube.com/shorts/BFA1rxrqg74?si=H7eCrFohvyV1dgqm");
                  },
                  backgroundColor: Color.fromRGBO(255, 192, 217,1),
                  image: AssetImage("assets/images/s3.jpg"),
                  title: "Kol",
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Kutu(
                  onTap: () {
                    _launchYoutubeLink("https://youtube.com/shorts/URzLr45qlps?si=zYB93Q61b0elXwgT");
                  },
                  backgroundColor: Color.fromRGBO(249, 249, 224,1),
                  image: AssetImage("assets/images/s2.jpg"),
                  title: "Yüz inceltme",
                ),
                Kutu(
                  onTap: () {
                    _launchYoutubeLink("https://youtu.be/oBs581oTFZM?si=sJvABN2k7D9kYo3P");
                  },
                  backgroundColor: Color.fromRGBO(138, 205, 215,1),
                  image: AssetImage("assets/images/s1.jpg"),
                  title: "Karın",
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Kutu(
                  onTap: () {
                    _launchYoutubeLink("https://youtube.com/shorts/Q0Lcae4GycQ?si=tTisjRJX4PGp1aAB");
                  },
                  backgroundColor: Color.fromRGBO(255, 143, 143,1),
                  image: AssetImage("assets/images/bacak.jpg"),
                  title: "Bacak",
                ),
                Kutu(
                  onTap: () {
                    _launchYoutubeLink("https://youtube.com/shorts/UAX4MEO635A?si=pqi6YGzwQCGaf8cW");
                  },
                  backgroundColor: Color.fromRGBO(154, 222, 123,1),
                  image: AssetImage("assets/images/sirt.jpg",),
                  title: "Omuz",
                ),
              ],
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  //canLaunch: linkin açılabilir olup olmadığını kontrol eder.
  //launch: belirtilen linki açar
  void _launchYoutubeLink(String link) async {
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      throw 'Could not launch $link';
    }
  }
}


class Kutu extends StatelessWidget {
  final ImageProvider<Object> image;
  final String title;
  final VoidCallback onTap;
  final Color backgroundColor;
  const Kutu({
    Key? key,
    required this.image,
    required this.title,
    required this.onTap,
    required this.backgroundColor,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        //padding: EdgeInsets.all(20),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical:15),
        decoration: BoxDecoration(
            color:  Color.fromRGBO(49, 48, 77,1),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                spreadRadius: 4, //Gölgenin yayılma miktarı
              ),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: image,
              radius: 80,
            ),
            SizedBox(
              height: 20,
            ),
            Text(         
              title,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white54,
                fontWeight: FontWeight.w500,
              ),
              
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}










