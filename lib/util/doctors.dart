import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Doctors extends StatelessWidget {
  final String  doctorImagePath;
  final String  rating;
  final String  doctorName;
  final String  doctorProffession;

  Doctors({
    required this.doctorImagePath,
    required this.rating,
    required this.doctorName,
    required this.doctorProffession,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 25.0),
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          boxShadow: [
            const BoxShadow(
              color: Color(0xFF311B92),
              offset: Offset(2, 2),
              blurRadius: 30,
              spreadRadius: 2,
            ),
            const BoxShadow(
              color: Colors.white,
              offset: Offset(-2, -2),
              blurRadius: 30,
              spreadRadius: 2,
            ),
          ],
          borderRadius: BorderRadius.circular(12),
          color: Colors.pink[200],
        ),

        child: Column(
          //picture
          children: [
            ClipRect(child: Image.asset(doctorImagePath,height: 50,
              //borderRadius: BorderRadius.circular(12),
            ),
            ),
            SizedBox(height: 2,),

//rating
            Container(


              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(12),
                color: Colors.deepPurple[200],),
              child: Row(

                children: [


                  Icon(Icons.star,color: Colors.yellow[500],),
                  Text(rating,style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),



                ],
              ),
            ),

//doctor name
            Text(doctorName,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),

            SizedBox(height: 5,),
            Container(
                padding:EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.deepPurple[200],),
                child: Text(doctorProffession + ', 7 Yrs Exp',style: TextStyle(color: Colors.white),)),
            

          ],
        ),


      ),



    );
  }
}




