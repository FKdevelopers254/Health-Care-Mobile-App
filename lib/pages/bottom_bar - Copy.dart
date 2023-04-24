import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:clinic/pages/pharmacy_page.dart';
import 'package:clinic/pages/qr_page.dart';
import 'package:clinic/pages/qrender.dart';
import 'package:clinic/pages/qrscan.dart';

import 'home_page.dart';



class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex=0;
  static final List<Widget>_widgetOptions =<Widget>[
    HomePage(),
    //const AppointmentPage(),
    const PharmacyPage(),



  ];
  void _onItemTapped(int index){

    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(

        child: _widgetOptions[_selectedIndex],

      ),

      bottomNavigationBar: BottomNavigationBar(

        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        elevation: 10,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.pink,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.indigo[900],

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),
              activeIcon: Icon(Icons.home_filled),
              label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.local_hospital),
              activeIcon: Icon(Icons.local_activity_rounded),
              label: "Appointment"),
          BottomNavigationBarItem(icon: Icon(Icons.medical_services),
              activeIcon: Icon(Icons.local_activity_rounded),
              label: "Pharmacy"),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_outlined),
              activeIcon: Icon(Icons.person_pin_outlined),
              label: "Account"),



        ],

      ),
    );
  }
}
