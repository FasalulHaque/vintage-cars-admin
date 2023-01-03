part of 'used_collection_bloc.dart';

@immutable
abstract class UsedCollectionState {}

class UsedCollectionInitial extends UsedCollectionState {}

class UsedCarAddSucess extends UsedCollectionState {}

class UsedCarAddFiled extends UsedCollectionState {
  UsedCarAddFiled();
}

