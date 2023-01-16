// ignore_for_file: avoid_print

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vintagecars_seller/add_Electric_cars/bloc/collection_bloc.dart';

import 'package:vintagecars_seller/home_screen/home.dart';

class AddCars extends StatefulWidget {
  AddCars({super.key});

  @override
  State<AddCars> createState() => _AddCarsState();
}

class _AddCarsState extends State<AddCars> {
  late final XFile? image;

  final carAdd =
      FirebaseFirestore.instance.collection('Electriccar_collection');

  final auth = FirebaseAuth.instance;

  final collectionbloc = CollectionBloc();

  // final ImagePicker imgpicker = ImagePicker();
  // List<XFile>? imagefiles;

  // openImages() async {
  //   try {
  //     var pickedfiles = await imgpicker.pickMultiImage();
  //     //you can use ImageCourse.camera for Camera capture
  //     if (pickedfiles != null) {
  //       imagefiles = pickedfiles;
  //       setState(() {});
  //     } else {
  //       print("No image is selected.");
  //     }
  //   } catch (e) {
  //     print("error while picking file.");
  //   }
  // }

  // Future<XFile?> getimage() async {
  //   final imagePicker = ImagePicker();
  //   pickedFile = imagePicker
  //       .pickImage(
  //         source: ImageSource.gallery,
  //       )
  //       .whenComplete(() => {setState(() {})});
  // }

  TextEditingController carnameController = TextEditingController();
  TextEditingController fuelTypeController = TextEditingController();
  TextEditingController drivingRangeController = TextEditingController();
  TextEditingController safetyController = TextEditingController();
  TextEditingController transmissionController = TextEditingController();
  TextEditingController batteryCapacityController = TextEditingController();
  TextEditingController seatingCapacityController = TextEditingController();
  TextEditingController topSpeedController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  List<XFile?>? imagefiles;

  bool isLoading = false;

  final imgpicker = ImagePicker();

  Future<List<XFile>>? pickedfiles;

  Future<void> openImages() async {
    try {
      pickedfiles = imgpicker.pickMultiImage();
      if (pickedfiles != null) {
        imagefiles = await pickedfiles;
        setState(() {});
        print('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
        print(imagefiles);
      } else {
        print('No image is selected.');
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => collectionbloc,
      child: BlocListener<CollectionBloc, CollectionState>(
        listener: (context, state) {
          if (state is CarAddSucess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                content: Text('Sucessfully added....'),
              ),
            );
            Navigator.push(
              context,
              MaterialPageRoute<dynamic>(
                builder: (context) => HomeScreen(),
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
                height: 1,
              ),
              TextButton(
                child: Text('Upload Images'),
                onPressed: openImages,
              ),
              FutureBuilder<List<XFile>>(
                future: pickedfiles,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final images = snapshot.data;
                    return Container(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: images!.length,
                        itemBuilder: (context, index) {
                          return Image.file(
                            File(images[index].path),
                            fit: BoxFit.cover,
                            width: 180,
                            height: 180,
                          );
                        },
                      ),
                    );
                  } else {
                    return Text('dfghdf');
                  }
                },
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: carnameController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 18,
                          horizontal: 10,
                        ),
                        labelText: 'Car Name',
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
                      height: 15,
                    ),
                    TextFormField(
                      controller: fuelTypeController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 18,
                          horizontal: 10,
                        ),
                        labelText: 'Fuel Type',
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
                      height: 15,
                    ),
                    TextFormField(
                      controller: drivingRangeController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 18,
                          horizontal: 10,
                        ),
                        labelText: 'Driving Range',
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
                      height: 15,
                    ),
                    TextFormField(
                      controller: safetyController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 18,
                          horizontal: 10,
                        ),
                        labelText: 'Safety',
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
                      height: 15,
                    ),
                    TextFormField(
                      //maxLines: 2,
                      //keyboardType: TextInputType.number,
                      controller: transmissionController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 18,
                          horizontal: 10,
                        ),
                        labelText: 'Transmission',
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
                      height: 15,
                    ),
                    TextFormField(
                      // maxLines: 2,
                      //keyboardType: TextInputType.number,
                      controller: batteryCapacityController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 18,
                          horizontal: 10,
                        ),
                        labelText: 'Battery Capacity',
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
                      height: 15,
                    ),
                    TextFormField(
                      controller: seatingCapacityController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 18,
                          horizontal: 10,
                        ),
                        labelText: 'Seating Capacity',
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
                      height: 15,
                    ),
                    TextFormField(
                      controller: topSpeedController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 18,
                          horizontal: 10,
                        ),
                        labelText: 'Top Speed',
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
                      height: 15,
                    ),
                    TextFormField(
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
                            collectionbloc.add(
                              CarAddEvent(
                                image: imagefiles,
                                name: carnameController.text,
                                fuel: fuelTypeController.text,
                                drivingRange: drivingRangeController.text,
                                safety: safetyController.text,
                                transmission: transmissionController.text,
                                battery: batteryCapacityController.text,
                                seating: seatingCapacityController.text,
                                speed: topSpeedController.text,
                                price: priceController.text,
                              ),
                            );
                          },
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 203, 222, 237),
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
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}



                  //   child: FutureBuilder<XFile?>(
                  //     future: pickedFile,
                  //     builder: (context, snap) {
                  //       if (snap.hasData) {
                  //         return ClipOval(
                  //           child: CircleAvatar(
                  //             radius: 70,
                  //             backgroundColor: Colors.white,
                  //             child: Image.file(
                  //               File(snap.data!.path),
                  //               fit: BoxFit.cover,
                  //               width: 180,
                  //               height: 180,
                  //             ),
                  //             //color: Colors.blue,
                  //           ),
                  //         );
                  //       }
                  //       return InkWell(
                  //         onTap: getimage,
                  //         child: CircleAvatar(
                  //           backgroundColor: Colors.white,
                  //           radius: 70,
                  //           // height: 200.0,
                  //           // color: Colors.blue,
                  //           child: Text(
                  //             'Upload Photo',
                  //             style: GoogleFonts.abel(
                  //               color: Colors.black,
                  //               fontSize: 22,
                  //             ),
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //   ),