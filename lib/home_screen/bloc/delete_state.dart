part of 'delete_bloc.dart';

@immutable
abstract class DeleteState {}

class DeleteInitial extends DeleteState {}

class DeleteEventSucess extends DeleteState {}

class DeleteEventFailed extends DeleteState {}

