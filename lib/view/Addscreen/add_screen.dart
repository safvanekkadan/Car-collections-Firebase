import 'package:firebase_wk1/controller/cars_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/textfield.dart';
import 'widgets/add_screen.dart';

class AddCars extends StatelessWidget {
  const AddCars({super.key});

  @override
  Widget build(BuildContext context) {
    final carprovider =Provider.of<CarsProvider>(context);
    return Scaffold(
       appBar: AppBar(centerTitle: true,
        title:const Text("Add Car",
        style: TextStyle(
           fontSize: 25,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
         
        ),),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        key: key ,
        child: Column(
          children:  [ 
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:carbrandselectvalues(
                carsProvider: carprovider,
              ),
            ),
           textfiled(labeltext: "Car name",controller:carprovider.CarName ),
           textfiled(labeltext: "Model ",controller: carprovider.Carmodel,),
            textfiled(labeltext: "Specification",controller: carprovider.CarSpec),
            const SizedBox(height: 20 ),
              CupertinoButton(
            onPressed: ()
            {
              carprovider.addCar();
              carprovider.Carmodel.clear();
              carprovider.CarName.clear();
              carprovider.Carmodel.clear();
              carprovider.CarSpec.clear();

              Navigator.pop(context);
            },
            color: CupertinoColors.black,
            padding: const EdgeInsets.all(10),
            disabledColor: Colors.grey,
            child: const Text("Submit"),
          ) 
          ]
          
        ),
      ),
    );
  }
}



