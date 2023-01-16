part of 'collection_bloc.dart';

@immutable
abstract class CollectionEvent {}

class CarAddEvent extends CollectionEvent {
  CarAddEvent({
    required this.image,
    required this.name,
    required this.fuel,
    required this.drivingRange,
    required this.safety,
    required this.transmission,
    required this.battery,
    required this.seating,
    required this.speed,
    required this.price,
  });

  List<XFile?>? image;
  String name;
  String fuel;
  String drivingRange;
  String safety;
  String transmission;
  String battery;
  String seating;
  String speed;
  String price;
}
