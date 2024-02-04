import 'package:final_fitnessapp/screens/home_screen.dart';
import 'package:final_fitnessapp/screens/messages_screen.dart';
import 'package:final_fitnessapp/screens/schedule_screen.dart';
import 'package:final_fitnessapp/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class NavbarRoots extends StatefulWidget {
  const NavbarRoots({super.key});

  @override
  State<NavbarRoots> createState() => _NavbarRootsState();
}

class _NavbarRootsState extends State<NavbarRoots> {
//Seçili olan alt gezinme çubuğu sekmesinin indeksini tutar.
  int _selectedIndex = 0;

  final _screens = [
    //Home Screen
    HomeScreen(),

    //Messages Screen
    MessagesScreen(),

    //Schedule Screen
    ScheduleScreen(),

    //Settings Screen
    SettingsScreen(),

  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : _screens[_selectedIndex],
      bottomNavigationBar: Container(
        height: 80,
        child: BottomNavigationBar(
          
          backgroundColor: Color.fromRGBO(22, 26, 48, 0.827),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color.fromRGBO(130, 9, 230,1),//Seçilmiş olan sekmenin simhe ve metin rengi
          unselectedItemColor: Colors.white,//Seçilmemiş olan sekmenin simge ve metin
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex=index;
            });
          },
          items:[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.schedule),
              label: 'Schedule',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}