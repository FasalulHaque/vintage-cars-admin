part of 'collection_bloc.dart';

@immutable
abstract class CollectionState {}

class CollectionInitial extends CollectionState {}

class CarAddSucess extends CollectionState {}

class CarAddFiled extends CollectionState {
  CarAddFiled();
}
