import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vintagecars_seller/add_Electric_cars/add_electric_cars.dart';
import 'package:vintagecars_seller/add_Electric_cars/bloc/collection_bloc.dart';
import 'package:vintagecars_seller/add_Electric_cars/view/color_picker.dart';

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

  TextEditingController carnameController = TextEditingController();
  TextEditingController fuelTypeController = TextEditingController();
  TextEditingController drivingRangeController = TextEditingController();
  TextEditingController safetyController = TextEditingController();
  TextEditingController transmissionController = TextEditingController();
  TextEditingController batteryCapacityController = TextEditingController();
  TextEditingController seatingCapacityController = TextEditingController();
  TextEditingController topSpeedController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController colors1Controller = TextEditingController();
  TextEditingController colors2Controller = TextEditingController();
  TextEditingController colors3Controller = TextEditingController();
  TextEditingController brandsController = TextEditingController();
  TextEditingController emiMonController = TextEditingController();
  TextEditingController loanAmouController = TextEditingController();
  TextEditingController interestController = TextEditingController();

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

  // create some values
  List<Color> pickerColors = [];
  Color currentColor = Color(0xff443a49);

// ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => pickerColors.add(color));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => collectionbloc,
      child: BlocListener<CollectionBloc, CollectionState>(
        listener: (context, state) {
          if (state is CarAddSucess) {
            Fluttertoast.showToast(
              msg: 'Sucessfully added....',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16,
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
                onPressed: openImages,
                child: const Text('Upload Images'),
              ),
              FutureBuilder<List<XFile>>(
                future: pickedfiles,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final images = snapshot.data;
                    return SizedBox(
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
                    TextCard(
                      controller: carnameController,
                      labelText: 'Car Name',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextCard(
                      controller: fuelTypeController,
                      labelText: 'Fuel Type',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextCard(
                      controller: drivingRangeController,
                      labelText: 'Driving Range',
                    ),
                    const SizedBox(
                      height: 12,
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
                      controller: batteryCapacityController,
                      labelText: 'Battery Capacity',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextCard(
                      controller: seatingCapacityController,
                      labelText: 'Seating Capacity',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                        height: 300,
                        child: MultipleChoiceBlockPicker(
                          pickerColors: [
                            Colors.white,
                          ], //default color
                          onColorsChanged: (List<Color> colors) {
                            pickerColors = colors;
                          },
                        )),
                    const SizedBox(
                      height: 12,
                    ),
                    TextCard(
                      controller: topSpeedController,
                      labelText: 'Top Speed',
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
                      labelText: 'EMi/Mont',
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
                      labelText: 'Interest Amount',
                    ),
                    TextButton(
                      onPressed: getImage,
                      child: const Text('Upload Logo'),
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
                                logo: image!,
                                image: imagefiles,
                                name: carnameController.text,
                                fuel: fuelTypeController.text,
                                drivingRange: drivingRangeController.text,
                                transmission: transmissionController.text,
                                battery: batteryCapacityController.text,
                                seating: seatingCapacityController.text,
                                speed: topSpeedController.text,
                                colors: pickerColors,
                                brands: brandsController.text,
                                price: priceController.text,
                                emiM: emiMonController.text,
                                loanAmou: loanAmouController.text,
                                interest: interestController.text,
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
