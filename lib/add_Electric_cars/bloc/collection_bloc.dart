import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
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

          final imageList = [];

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

          await carAdd.doc(carId).set({
            'cars_name': event.name,
            'fuel_type': event.fuel,
            'driving_range': event.drivingRange,
            'transmission': event.transmission,
            'safety': event.safety,
            'seating_capacity': event.seating,
            'battery_capacity': event.battery,
            'top_speed': event.speed,
            'cars_price': event.price,
            'cars_imags': imageList,
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