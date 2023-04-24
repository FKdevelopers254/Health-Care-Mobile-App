import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../util/category_card.dart';

class PharmacyPage extends StatefulWidget {
  const PharmacyPage({Key? key}) : super(key: key);

  @override
  State<PharmacyPage> createState() => _PharmacyPageState();
}

class _PharmacyPageState extends State<PharmacyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:         Center(
          child: Shimmer.fromColors(
            baseColor: Colors.red,
            highlightColor: Colors.yellow,
            child: Text(
              'Pharmacy',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35.0,
                fontWeight:
                FontWeight.bold,
              ),
            ),
          ),
        ),

      ),
      body: SafeArea(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2/2.9,
            mainAxisSpacing: 2,
            crossAxisSpacing: 10,
          ),
            itemCount: 6,
          itemBuilder: (BuildContext context, int index) {



            return InkWell(
             // onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HotelScreen(hotel: _filteredItems[index]),),);},
              child: Container(
                margin: const EdgeInsets.only(top: 5.0,bottom: 5.0),
                width: 210.0,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Hero(
                            tag: 'lib/images/nurse.png',
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image(
                                height: 180.0,
                                width: 180.0,
                                image: AssetImage('lib/images/nurse.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              //    color: Theme.of(context).primaryColor.withOpacity(0.8),
                            ),

                            child: Padding(
                              padding: const EdgeInsets.only(left: 4.0,top: 4.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        FontAwesomeIcons.hotel,
                                        size: 15.0,
                                        color: Colors.black,
                                      ),
                                      const SizedBox(width: 5.0),
                                      Wrap(
                                        children: [
                                          Text(
                                            'lib/images/nurse.png',
                                            style: GoogleFonts.bebasNeue(
                                              color: Colors.green,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w600,
                                              // letterSpacing: 1.2,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: <Widget>[
                                          const Icon(
                                            FontAwesomeIcons.locationArrow,
                                            size: 15.0,
                                            color: Colors.black,
                                          ),
                                          const SizedBox(width: 5.0),
                                          Text(
                                            'lib/images/nurse.png',
                                            style:GoogleFonts.bebasNeue(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15

                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        'pen',
                                        style: GoogleFonts.bebasNeue(
                                          color: Colors.red,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),

                                    ],
                                  ),
                                ],
                              ),
                            ),

                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),


            );
        },),
      ),
    );
  }
}
