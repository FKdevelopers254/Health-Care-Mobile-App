
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';


import 'package:clinic/pages/pharmacy_page.dart';
import 'package:clinic/pages/qr_page.dart';
import 'package:clinic/pages/qrender.dart';
import 'package:clinic/pages/qrscan.dart';


import 'account_page.dart';
import 'home_page.dart';
import 'newhomepage.dart';



class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();




}

class _BottomBarState extends State<BottomBar> {






  final items = const [
    Icon(Icons.home_filled),
    Icon(Icons.medical_services),

    Icon(Icons.qr_code_scanner_sharp),
    Icon(Icons.person),


  ];
  int index = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(

        child: getSelectedWidget(index: index),

      ),

      bottomNavigationBar: CurvedNavigationBar(

        animationDuration: const Duration(milliseconds: 300),
        animationCurve: Curves.bounceIn,
        height: 55,
        color: Colors.grey.shade200,
        buttonBackgroundColor:Colors.yellow.shade200,
        backgroundColor:Colors.pink.shade200,

        items:items,
        index: index,
        onTap: (selectedIndex){
          setState(() {
            index = selectedIndex;
          });
        },

      ),
    );
  }




  Widget getSelectedWidget({required int index}){
    Widget widget;
    switch(index){
      case 0:
        widget = HomePage();
        break;

      case 1:
        widget = const PharmacyPage();
        break;
      case 2:
        widget = Qrender();


        break;
      default:
        widget = const RHomePage();
        break;
    }
    return widget;
  }




}
