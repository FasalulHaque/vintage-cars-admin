part of 'used_collection_bloc.dart';

@immutable
abstract class UsedCollectionEvent {}

class UsedCarAddEvent extends UsedCollectionEvent {
  UsedCarAddEvent({
    required this.image,
    required this.name,
    required this.kilometers,
    required this.registration,
    required this.registeredIn,
    required this.fuel,
    required this.transmission,
    required this.insurance,
    required this.mileage,
    required this.maxpower,
    required this.seating,
    required this.model,
    required this.price,
    required this.logo,
    required this.brands,
    required this.emiM,
    required this.loanAmou,
    required this.interest,
    required this.colors,
    

    

    

  });

  List<XFile?>? image;
  String name;
  String kilometers;
  String registration;
  String registeredIn;
  String fuel;
  String transmission;
  String insurance;
  String mileage;
  String maxpower;
  String seating;
  String model;
  String price;
  XFile logo;
  String brands;
  String emiM;
  String loanAmou;
  String interest;
  List<Color> colors;
}
