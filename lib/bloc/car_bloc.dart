import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:rental_app/bloc/car_event.dart';
import 'package:rental_app/bloc/car_state.dart';
import 'package:rental_app/domain/usecases/get_cars.dart';

class CarBloc extends Bloc<CarEvent, CarState>{
  final GetCars getCars;
  CarBloc({required this.getCars}) : super(CarLoading()){
    on<LoadCars>(
      (event, emit) async{
        emit(CarLoading());
        try{
          final cars = await getCars.call();
          emit(CarsLoaded(cars));
        }catch(e){
          emit(CarsError(e.toString()));
        }
      }
    );
  }
}