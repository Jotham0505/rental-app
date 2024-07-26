import 'package:rental_app/data/car_model.dart';

abstract class CarState {}

class CarLoading extends CarState {}

class CarsLoaded extends CarState{
  final List <Car> cars;
  CarsLoaded(this.cars);
}

class CarsError extends CarState {
  final String message;
  CarsError(this.message);
}