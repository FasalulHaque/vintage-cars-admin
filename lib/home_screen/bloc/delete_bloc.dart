import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'delete_event.dart';
part 'delete_state.dart';

class DeleteBloc extends Bloc<DeleteEvent, DeleteState> {
  DeleteBloc() : super(DeleteInitial()) {
    on<DeleteEvent>((event, emit) async {
  if (event is DeleteOptionEvent) {
        final electricCar =
            FirebaseFirestore.instance.collection('Electriccar_collection');

        try {
          await electricCar.doc(event.eleid).delete();

          emit(DeleteEventSucess());
        } catch (e) {
          emit(DeleteEventFailed());
        }
      }    });
  }
}
