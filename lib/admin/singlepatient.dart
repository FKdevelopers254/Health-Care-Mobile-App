import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SinglePatient extends StatefulWidget {
  final String userId;

  SinglePatient({required this.userId});

  @override
  _SinglePatientState createState() => _SinglePatientState();
}

class _SinglePatientState extends State<SinglePatient> {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Map<String, dynamic>? _patientData;



  Future<void> _deletePatient(BuildContext context) async {
    final result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Delete Patient"),
          content: Text("Are you sure you want to delete this patient?"),
          actions: <Widget>[
            MaterialButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text("Cancel"),
            ),
            MaterialButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text("Delete"),
            ),
          ],
        );
      },
    );

    if (result == true) {
      try {
        await FirebaseFirestore.instance
            .collection('users')
            .where('email', isEqualTo: widget.userId)
            .get();
            //.delete();
        Navigator.pop(context);
      } catch (e) {
        // show error message
      }
    }
  }


  @override
  void initState() {
    super.initState();

    // Fetch the patient details from Firestore
    _db
        .collection('users')
        .where('email', isEqualTo: widget.userId)
        .get()
        .then((QuerySnapshot snapshot) {
      if (snapshot.docs.isNotEmpty) {
        setState(() {
          _patientData = snapshot.docs.first.data() as Map<String, dynamic>?;

        });
      }
    }).catchError((error) {
      print('Error fetching patient data: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Details'),
      ),
      body: _patientData == null
          ? Center(
        child: CircularProgressIndicator(),
      )
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Name: ${_patientData!['firstname']} ${_patientData!['lastname']}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Email: ${_patientData!['email']}',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Location: ${_patientData!['location']}',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Age: ${_patientData!['age']}',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),

          ElevatedButton(
            onPressed: () => _deletePatient(context),
            child: Text("Delete Patient",style: TextStyle(color: Colors.red,),),

          ),

        ],
      ),
    );
  }
}
