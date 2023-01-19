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
    required this.colors1,
    required this.colors2,
    required this.colors3,
    required this.brands,
    required this.logo,
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
  String colors1;
  String colors2;
  String colors3;
  String brands;
  XFile logo;
}
