part of 'collection_bloc.dart';

@immutable
abstract class CollectionEvent {}

class CarAddEvent extends CollectionEvent {
  CarAddEvent({
    required this.image,
    required this.name,
    required this.description,
    required this.price,
  });

  XFile image;
  String name;
  String description;
  double price;
}
