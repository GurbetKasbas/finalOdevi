
//import 'package:final_fitnessapp/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      
      child: Padding(
        
        padding: EdgeInsets.only(top:20 , left:20 ,right:20 ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Settings",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
    
              ),
            ),
            SizedBox(height: 30,),
            ListTile(
              leading: CircleAvatar(
    
                radius: 20,
                backgroundImage: AssetImage("assets/images/p1.jpg"),
    
                
              ),
              title:Text("Jjoewanöm",
              style: TextStyle(
                fontSize:25,
                fontWeight: FontWeight.w500
                ),
              ),
              subtitle: Text("Profile"),
            ),
            Divider(height: 50,),
            //1
            Settings(
              onTap: () {
                
              },
              icon: Icon(Icons.person),
              title: "Profile",
              color: Colors.blue.shade300,
            ),
            SizedBox(height: 20,),
            //2
            Settings(
              onTap: () {
                
              },
              icon: Icon(Icons.notifications),
              title: "Notifications",
              color: Colors.deepPurple.shade300,
            ),
            SizedBox(height: 20,),
            //3
            Settings(
              onTap: () {
                
              },
              icon: Icon(Icons.privacy_tip_outlined),
              title: "Privacy ",
              color: Colors.indigo.shade300,
            ),
            SizedBox(height: 20,),
            //4
            Settings(
              onTap: () {
                
              },
              icon: Icon(Icons.settings_suggest_outlined),
              title: "General",
              color: Colors.green.shade300,
            ),
            SizedBox(height: 20,),
            Settings(
              onTap: () {
                
              },
              icon: Icon(Icons.info_outline_rounded),
              title: "About Us",
              color: Colors.orange.shade300,
            ),
            Divider(height: 50,),
            
            Settings(
              onTap: () {
                _logoutDialog(context);
              },
              icon: Icon(Icons.logout),
              title: "Log Out",
              color: Colors.redAccent.shade400,
            ),

          ],
        ),
        ),
    );
  }
}

void _logout(BuildContext context) async{
  try{
    Navigator.of(context).popUntil((route) => route.isFirst);
  }catch(e){
    print("Çıkış yaparken bir hata oluştu: $e");
  }
}
  //Çıkış yapmdan önce uyarı ekranı
  void _logoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Çıkış Yap"),
          content: Text("Çıkış yapmak istediğinizden emin misiniz?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Uyarıyı kapat
              },
              child: Text("İptal"),
            ),
            TextButton(
              onPressed: () {
                _logout(context); // Çıkış yap
              },
              child: Text("Evet"),
            ),
          ],
        );
      },
    );
  }

//Ayarlar Kısmı
class Settings extends StatelessWidget {
  final Color color;
  final String title;
  final Icon icon;
  final VoidCallback onTap;

  const Settings({
    Key? key,
    required this.color,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle
         ),
         child: icon,
      ),
      title: Text(title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500
      ),
      ),
      trailing: Icon(Icons.arrow_forward_ios_rounded),
    );
  }
}