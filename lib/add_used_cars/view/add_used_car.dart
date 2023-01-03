import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vintagecars_seller/add_used_cars/bloc/used_collection_bloc.dart';

import 'package:vintagecars_seller/home_screen/home.dart';
import 'package:vintagecars_seller/used_car/used_car.dart';

class AddUsedCars extends StatefulWidget {
  AddUsedCars({super.key});

  @override
  State<AddUsedCars> createState() => _AddCarsState();
}

class _AddCarsState extends State<AddUsedCars> {
  late final XFile? image;

  final carAdd = FirebaseFirestore.instance.collection('Usedcar_collection');

  final auth = FirebaseAuth.instance;
  final usedCollection = UsedCollectionBloc();

  late Future<XFile?> pickedFile = Future.value(null);

  bool isLoading = false;

  Future<XFile?> getimage() async {
    final imagePicker = ImagePicker();
    pickedFile = imagePicker
        .pickImage(
          source: ImageSource.gallery,
        )
        .whenComplete(() => {setState(() {})});
  }

  TextEditingController nameController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => usedCollection,
      child: BlocListener<UsedCollectionBloc, UsedCollectionState>(
        listener: (context, state) {
          if (state is UsedCarAddSucess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Sucessfully added'),
              ),
            );
            Navigator.push(
              context,
              MaterialPageRoute<dynamic>(
                builder: (context) => UsedCar(),
              ),
            );
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: getimage,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 90,
                  child: FutureBuilder<XFile?>(
                    future: pickedFile,
                    builder: (context, snap) {
                      if (snap.hasData) {
                        return ClipOval(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 90,
                            child: Image.file(
                              File(snap.data!.path),
                              height: 160,
                              fit: BoxFit.cover,
                              width: 180,
                            ),
                            //color: Colors.blue,
                          ),
                        );
                      }
                      return InkWell(
                        onTap: getimage,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 70,
                          // height: 200.0,
                          // color: Colors.blue,

                          child: Text(
                            'Upload Photo',
                            style: GoogleFonts.abel(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 17,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      maxLines: 2,
                      controller: nameController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 18,
                          horizontal: 10,
                        ),
                        labelText: 'Name',
                        labelStyle: GoogleFonts.abel(),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      maxLines: 8,
                      controller: descriptionController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 18,
                          horizontal: 10,
                        ),
                        labelText: 'Description',
                        labelStyle: GoogleFonts.abel(),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      maxLines: 2,
                      //keyboardType: TextInputType.number,
                      controller: priceController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 18,
                          horizontal: 10,
                        ),
                        labelText: 'Price',
                        labelStyle: GoogleFonts.abel(),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ColoredBox(
                color: Colors.white,
                child: Center(
                  child: GestureDetector(
                    onTap: isLoading
                        ? null
                        : () {
                            usedCollection.add(
                              UsedCarAddEvent(
                                image: pickedFile,
                                name: nameController.text,
                                description: descriptionController.text,
                                price: priceController.text,
                              ),
                            );
                          },
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 203, 222, 237),
                        //grey.shade300,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                            spreadRadius: 1,
                            blurRadius: 9,
                            offset: Offset(
                              3,
                              3,
                            ),
                          ),
                          BoxShadow(
                            color: Colors.white,
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: Offset(-4, -4),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text('ADD'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
