part of 'collection_bloc.dart';

@immutable
abstract class CollectionEvent {}

class CarAddEvent extends CollectionEvent {
  CarAddEvent({
    required this.image,
    required this.name,
    required this.fuel,
    required this.drivingRange,
    required this.transmission,
    required this.battery,
    required this.seating,
    required this.speed,
    required this.price,
    required this.colors,
    required this.brands,
    required this.logo,
    required this.emiM,
    required this.loanAmou,
    required this.interest,
  });

  List<XFile?>? image;
  String name;
  String fuel;
  String drivingRange;
  String transmission;
  String battery;
  String seating;
  String speed;
  String price;
  List<Color> colors;
  String brands;
  XFile logo;
  String emiM;
  String loanAmou;
  String interest;
}
