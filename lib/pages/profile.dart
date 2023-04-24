import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class UpdateProf extends StatefulWidget {
  final String docId;

  UpdateProf({required this.docId});

  @override
  _UpdateProfState createState() => _UpdateProfState();
}

class _UpdateProfState extends State<UpdateProf> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _firstnameController;
  late TextEditingController _lastnameController;
  late TextEditingController _ageController;
  late TextEditingController _locationController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _firstnameController = TextEditingController();
    _lastnameController = TextEditingController();
    _ageController = TextEditingController();
    _locationController = TextEditingController();
    _emailController = TextEditingController();

    _loadData();
  }

  @override
  void dispose() {
    _firstnameController.dispose();
    _lastnameController.dispose();
    _ageController.dispose();
    _locationController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _loadData() async {
    //Lottie.asset('lib/icons/101571-pediatrics.json');
    final doc = await FirebaseFirestore.instance.collection('users').doc(widget.docId).get();
    final data = doc.data() as Map<String, dynamic>;
    _firstnameController.text = data['firstname'];
    _lastnameController.text = data['lastname'];

    _ageController.text = data['age'].toString();
    _locationController.text = data['location'];
    _emailController.text = data['email'];

  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      final firstname = _firstnameController.text.trim();
      final lastname = _lastnameController.text.trim();

      final age = int.parse(_ageController.text.trim());
      final location = _locationController.text.trim();
      final email = _emailController.text.trim();


      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: Stack(
              children: [
                CircularProgressIndicator(),
            Lottie.asset('lib/icons/65710-hospital-5.json')
              ],
            ),
          );
        },
      );


      await FirebaseFirestore.instance.collection('users').doc(widget.docId).update({
        'firstname': firstname,
        'lastname': lastname,
        'age': age,
        'email': email,
        'location': location,

      });
      // add a delay of 3 seconds
      await Future.delayed(Duration(seconds: 3));

      // dismiss the progress indicator dialog
      Navigator.pop(context);


      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text('Profile Updated successfully!'),
          );
        },
      );

      // add a delay of 3 seconds
      await Future.delayed(Duration(seconds: 3));

      // pop the context
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Shimmer.fromColors(
          baseColor: Colors.red,
          highlightColor: Colors.yellow,
          child: Text(
            'UPDATE PROFILE', textAlign: TextAlign.center, style: GoogleFonts.andika(letterSpacing:3.5,fontSize: 20.0, fontWeight: FontWeight.bold,
          ),
          ),
        ),
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _firstnameController,
                decoration: const InputDecoration(
                  labelText: 'First Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Edit first name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _lastnameController,
                decoration: const InputDecoration(
                  labelText: 'Last Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Edit last name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(
                  labelText: 'Age',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a Price';
                  }
                  final rating = int.tryParse(value);
                  if (rating == null || rating < 0 || rating > 50000000) {
                    return 'Please enter a rating between 0 and 5000000';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _locationController,
                decoration: const InputDecoration(
                  labelText: 'Location',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Location';
                  }
                  return null;
                },
              ),


              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please edit Email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),


              ElevatedButton(

                onPressed: _submit,
                child: Shimmer.fromColors(
                  baseColor: Colors.red,
                  highlightColor: Colors.yellow,
                  child: Text('Save',style: GoogleFonts.andika(),),
                ),

              ),

            ],
          ),
        ),
      ),
    );
  }
}
