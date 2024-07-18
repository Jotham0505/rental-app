
import 'package:rental_app/data/car_model.dart';
import 'package:rental_app/domain/repositories/car_repository.dart';

class GetCars {
  final CarRepository repository;

  GetCars(this.repository);

  Future<List<Car>> call() async{
    return repository.fetchCars();
  }
}