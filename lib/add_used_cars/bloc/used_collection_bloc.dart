import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'used_collection_event.dart';
part 'used_collection_state.dart';

class UsedCollectionBloc
    extends Bloc<UsedCollectionEvent, UsedCollectionState> {
  UsedCollectionBloc() : super(UsedCollectionInitial()) {
    on<UsedCollectionEvent>((event, emit) async {
      if (event is UsedCarAddEvent) {
        try {
          final auth = FirebaseAuth.instance;
          final carAdd =
              FirebaseFirestore.instance.collection('Usedcar_collection');

          final userId = auth.currentUser!.uid;

          var uuid = const Uuid();
          var carId = uuid.v4();
          XFile? image = await event.image;

          final refernce = FirebaseStorage.instance
              .ref()
              .child('cars_image')
              .child(image!.name);

          final file = File(image.path);
          await refernce.putFile(file);
          final imagelink = await refernce.getDownloadURL();

          await carAdd.doc(carId).set({
            'cars_name': event.name,
            'cars_description': event.description,
            'cars_price': event.price,
            'cars_image': imagelink,
            'car_id': carId,
            'user_id': userId,
            'type': 'used'
          });
          emit(UsedCarAddSucess());
        } catch (e) {
          print(e);
          emit(UsedCarAddFiled());
        }
      }
    });
  }
}
