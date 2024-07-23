import 'package:flutter/material.dart';
import 'package:rental_app/data/car_model.dart';
import 'package:rental_app/pages/map_details_page.dart';
import 'package:rental_app/widgets/car_card.dart';
import 'package:rental_app/widgets/more_card.dart';

class CarDetailsPage extends StatefulWidget {
  const CarDetailsPage({super.key, required this.car});

  final Car car;

  @override
  State<CarDetailsPage> createState() => _CarDetailsPageState();
}

class _CarDetailsPageState extends State<CarDetailsPage> with SingleTickerProviderStateMixin{
  AnimationController ? _controller; // animation controller for tween animation
  Animation<double>? _animation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(_controller!)..addListener(() {setState(() {   
    });});

    _controller!.forward();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _controller!.forward();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.info_outline),
            Text(' Information')
          ],
        ),
      ),
      body: Column(
        children: [
          CarCard(
            car: Car(
                model: widget.car.model,
                distance: widget.car.distance,
                fuelCapacity: widget.car.fuelCapacity,
                pricePerHour: widget.car.pricePerHour),
          ),

          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    width: 90,
                    decoration: BoxDecoration(
                        color: Color(0xffF3F3F3),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              spreadRadius: 5)
                        ]),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage('assets/user.png'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'James Cooper',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$4,253',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MapsDetailsPage(car: widget.car)));
                    },
                    child: Container(
                      height: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),

                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10,
                                spreadRadius: 5)
                          ]),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Transform.scale(
                              scale: _animation!.value,
                              alignment: Alignment.center,
                              child: Image.asset('assets/maps.png',fit: BoxFit.cover,),
                            ),
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                MoreCard(
                  car:Car(
                model: widget.car.model + "-1",
                distance: widget.car.distance + 100,
                fuelCapacity: widget.car.fuelCapacity + 100,
                pricePerHour: widget.car.pricePerHour + 10),
                ),
                SizedBox(height: 7,),
                 MoreCard(
                  car: Car(
                model: widget.car.model + "-2",
                distance: widget.car.distance + 200,
                fuelCapacity: widget.car.fuelCapacity + 200,
                pricePerHour: widget.car.pricePerHour + 20),
                ),
                SizedBox(height: 7,),
                 MoreCard(
                  car: Car(
                model: widget.car.model + "-3",
                distance: widget.car.distance + 300,
                fuelCapacity: widget.car.fuelCapacity + 300,
                pricePerHour: widget.car.pricePerHour + 30),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}