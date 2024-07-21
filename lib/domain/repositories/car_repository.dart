import 'package:rental_app/data/car_model.dart';


abstract class CarRepository{
  Future<List<Car>> fetchCars(); // car repo
}