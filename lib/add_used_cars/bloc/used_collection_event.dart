part of 'used_collection_bloc.dart';

@immutable
abstract class UsedCollectionEvent {}
class UsedCarAddEvent extends UsedCollectionEvent {
  UsedCarAddEvent({
    required this.image,
    required this.name,
    required this.description,
    required this.price,
  });

  Future<XFile?> image;
  String name;
  String description;
  String price;
}
