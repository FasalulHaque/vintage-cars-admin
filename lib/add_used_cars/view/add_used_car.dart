import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vintagecars_seller/add_Electric_cars/add_electric_cars.dart';
import 'package:vintagecars_seller/add_used_cars/bloc/used_collection_bloc.dart';

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

  // late Future<XFile?> pickedFile = Future.value(null);

  bool isLoading = false;
  List<XFile?>? imagefiles;

  Future<List<XFile>>? pickedfiles;

  final imgpicker = ImagePicker();

  Future<void> openImages() async {
    try {
      pickedfiles = imgpicker.pickMultiImage();
      if (pickedfiles != null) {
        imagefiles = await pickedfiles;
        setState(() {});
      } else {
        print('');
      }
    } catch (e) {}
  }

  Future<XFile?> getImage() async {
    print('==========');
    final _imagePicker = ImagePicker();

    image = await _imagePicker.pickImage(source: ImageSource.gallery);
    print('-----${image!.name}');
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController kilometersController = TextEditingController();
  TextEditingController registrationController = TextEditingController();
  TextEditingController registeredinController = TextEditingController();
  TextEditingController fuelController = TextEditingController();
  TextEditingController transmissionController = TextEditingController();
  TextEditingController insuranceController = TextEditingController();
  TextEditingController mileageController = TextEditingController();
  TextEditingController maxpowerController = TextEditingController();
  TextEditingController seatingController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController brandsController = TextEditingController();
  TextEditingController emiMonController = TextEditingController();
  TextEditingController loanAmouController = TextEditingController();
  TextEditingController interestController = TextEditingController();
  List<Color> pickerColors = [];
  Color currentColor = Color(0xff443a49);

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
          backgroundColor: Colors.red,
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
                    return const Text('');
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
                    TextCard(controller: nameController, labelText: 'Car Name'),
                    const SizedBox(
                      height: 12,
                    ),
                    TextCard(
                      controller: kilometersController,
                      labelText: 'Kilometers Driven',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextCard(
                      controller: registrationController,
                      labelText: 'Registration',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextCard(
                      controller: registeredinController,
                      labelText: 'Registered in',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextCard(
                      controller: fuelController,
                      labelText: 'Fuel Type',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextCard(
                      controller: transmissionController,
                      labelText: 'Transmission',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextCard(
                      controller: insuranceController,
                      labelText: 'Insurance',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextCard(
                      controller: maxpowerController,
                      labelText: 'Max power(bhp)',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextCard(
                      controller: mileageController,
                      labelText: 'Mileage(kmpl)',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextCard(
                      controller: modelController,
                      labelText: 'Model',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextCard(
                      controller: seatingController,
                      labelText: 'Seating capacity',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextCard(
                      controller: brandsController,
                      labelText: 'Brand',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextCard(
                      controller: priceController,
                      labelText: 'Price',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextCard(
                      controller: emiMonController,
                      labelText: 'Emi/Mon',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextCard(
                      controller: loanAmouController,
                      labelText: 'Loan Amount',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextCard(
                      controller: interestController,
                      labelText: 'Interest Amoun',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextButton(
                      onPressed: getImage,
                      child: const Text('Upload Logo'),
                    ),
                    SizedBox(
                      height: 300,
                      child: MultipleChoiceBlockPicker(
                        pickerColors: [
                          Colors.red,
                        ], //default color
                        onColorsChanged: (List<Color> colors) {
                          pickerColors = colors;
                        },
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
                                image: imagefiles,
                                name: nameController.text,
                                kilometers: kilometersController.text,
                                registration: registrationController.text,
                                registeredIn: registeredinController.text,
                                fuel: fuelController.text,
                                transmission: transmissionController.text,
                                insurance: insuranceController.text,
                                maxpower: maxpowerController.text,
                                mileage: mileageController.text,
                                seating: seatingController.text,
                                model: modelController.text,
                                price: priceController.text,
                                logo: image!,
                                brands: brandsController.text,
                                emiM: emiMonController.text,
                                loanAmou: loanAmouController.text,
                                interest: interestController.text,
                                colors: pickerColors,
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
