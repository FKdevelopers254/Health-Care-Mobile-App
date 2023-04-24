import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final String  doctorImagePath;
  final String  rating;
  final String  doctorName;
  final String  doctorProffession;

  DoctorCard({
    required this.doctorImagePath,
    required this.rating,
    required this.doctorName,
    required this.doctorProffession,
});


  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.only(left: 25.0),
      child: Container(
        padding: EdgeInsets.all(25),
        decoration:  BoxDecoration (
          borderRadius:  BorderRadius.circular(25),
          color:  Color(0x63000000),
          image:  DecorationImage (
            fit:  BoxFit.cover,
            image: AssetImage('lib/images/wallpaper2.jpg'),
          ),
        ),

        child: Column(
          //picture
          children: [
            ClipRect(child: Image.asset(doctorImagePath,height: 90,
              //borderRadius: BorderRadius.circular(12),
            ),
            ),
            SizedBox(height: 10,),

            Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.deepPurple[200],),
              child: Row(
                children: [

                  Icon(Icons.star,color: Colors.yellow[200],),
                  Text(rating,style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),



              ],
              ),
            ),

            Wrap(
              children: [
                Text(doctorName,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(height: 5,),
            Container(
                padding:EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.deepPurple[200],),
                child: Wrap(
                  children: [
                    Wrap(
                      children: [
                        Text(doctorProffession + ', 7 Yrs Exp',style: TextStyle(color: Colors.white),maxLines: 1,overflow: TextOverflow.ellipsis,),
                      ],
                    ),
                  ],
                )),





          ],
        ),

      ),
    );
  }
}
