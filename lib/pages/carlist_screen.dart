import 'package:flutter/material.dart';
import 'package:rental_app/models/car_model.dart';
import 'package:rental_app/widgets/car_card.dart';

class CarListScreen extends StatelessWidget {
  final List<Car> cars =[
    Car(model: 'Fortuner GR', distance: 870, fuelCapacity: 50, pricePerHour: 45),
    Car(model: 'Fortuner GR', distance: 870, fuelCapacity: 50, pricePerHour: 45),
    Car(model: 'Fortuner GR', distance: 870, fuelCapacity: 50, pricePerHour: 45),
  ];
  CarListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Choose Your Car')),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          return CarCard(car: cars[index]);
        },
      ),
    );
  }
}