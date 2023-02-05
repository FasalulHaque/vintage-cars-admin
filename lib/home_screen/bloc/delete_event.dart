part of 'delete_bloc.dart';

@immutable
abstract class DeleteEvent {}
class DeleteOptionEvent extends DeleteEvent {
  DeleteOptionEvent({required this.eleid});
   String eleid;
}
