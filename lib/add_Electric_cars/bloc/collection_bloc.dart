import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';
part 'collection_event.dart';
part 'collection_state.dart';

class CollectionBloc extends Bloc<CollectionEvent, CollectionState> {
  CollectionBloc() : super(CollectionInitial()) {
    on<CollectionEvent>((event, emit) async {
      if (event is CarAddEvent) {
        try {
          final auth = FirebaseAuth.instance;
          final carAdd =
              FirebaseFirestore.instance.collection('Electriccar_collection');

          final userId = auth.currentUser!.uid;

          var uuid = const Uuid();
          var carId = uuid.v4();
          final images = event.image;

          final imageList = <String>[];

          for (final image in images!) {
            final refernce = FirebaseStorage.instance
                .ref()
                .child('cars_image')
                .child(image!.name);
            final file = File(image.path);
            await refernce.putFile(file);
            final imagelink = await refernce.getDownloadURL();

            imageList.add(imagelink);
          }

          final reference = FirebaseStorage.instance
              .ref()
              .child('LogoImage')
              .child(event.logo.name);
          final file = File(event.logo.path);
          await reference.putFile(file);
          final imageLinkk = await reference.getDownloadURL();
          print('---------------------------');
          print(event.colors);

          final intColors = [];
          for (final element in event.colors) {
            intColors.add(element.value);
          }

          print(intColors);

          await carAdd.doc(carId).set({
            'cars_name': event.name,
            'fuel_type': event.fuel,
            'driving_range': event.drivingRange,
            'transmission': event.transmission,
            'seating_capacity': event.seating,
            'battery_capacity': event.battery,
            'top_speed': event.speed,
            'cars_price': event.price,
            'cars_imags': imageList,
            'colors': intColors,
            'brands': event.brands,
            'brands_logo': imageLinkk,
            'emi/mon': event.emiM,
            'loan_Amount': event.loanAmou,
            'interest_Amoun': event.interest,
            'car_id': carId,
            'user_id': userId,
            'type': 'electric'
          });

          emit(CarAddSucess());
        } catch (e) {
          print(e);
          emit(CarAddFiled());
        }
      }
    });
  }
}
