import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {

  final iconImagePath;
  final String categoryName;

  CategoryCard({super.key,
    required this.iconImagePath,
    required this.categoryName,
});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Container(
        padding: const EdgeInsets.only(left: 10,right: 10),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.deepPurple[200],
        ),
        child: Row(
          children: [
            Image.asset(iconImagePath,height: 30,),
            SizedBox(width: 10,),
            Wrap(
              children: [
                Text(categoryName,style: TextStyle(color: Colors.white),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
