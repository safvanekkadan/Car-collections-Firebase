import 'package:firebase_wk1/controller/cars_provider.dart';
import 'package:firebase_wk1/controller/inernetconnectivy_provider.dart';
import 'package:firebase_wk1/model/cars_model.dart';
import 'package:firebase_wk1/view/Addscreen/add_screen.dart';
import 'package:firebase_wk1/constants/string/string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

 const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0,
        centerTitle: true,
        title:const Text("Collections",
        style: TextStyle(
          fontSize: 25,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
         
        ),),
        backgroundColor: Colors.transparent,
      ),
      floatingActionButton:FloatingActionButton(
          onPressed: (){
             Navigator.push(context, 
        MaterialPageRoute(builder: (context)=> const AddCars()));
          },
        backgroundColor: Colors.blueGrey,
        child: const Icon(Icons.add,
        size: 22,),
        
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    body: Consumer<CarsProvider>(
      builder: (context, provider, child) {
        if(provider.listcars.isEmpty){
          Provider.of<InternetConnectivityProvider>(context,listen: false)
          .getInternetConnectivity(context);
          provider.fetchCars();
            return const Center(child: Text('Empty',style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 30)));
        }
         return ListView.builder(
          itemCount:provider.listcars.length,
          itemBuilder:(context, index) {
         final CarModel cars=provider.listcars[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                      spreadRadius: 2
                    )
                  ],
                borderRadius: BorderRadius.circular(20),
                color: Colors.black,
                  image: DecorationImage(
                    image: NetworkImage(
                      backgroundcars[1]),
                  fit: BoxFit.cover),
                ),
                height: 200,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                      Text(cars.carbrand.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),),
                      Text(cars.carname.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),),
                      Text(cars.carmodel.toString(),
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),),
                      Text(cars.carspecification.toString(),
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),
                     ),
                    ],        
                   ),
                  ),
                  Row(
                  children: [
                  CupertinoButton(
                onPressed: () {
                Navigator.pushNamed(context, '/update',
                arguments:{
                'carname':cars.carname,
                'carbrand':cars.carbrand,
                'carmodel':cars.carmodel,
                'carspecification':cars.carspecification,
                'id':cars.id,
                  } );      
                    
                   },
                   child: const Icon(CupertinoIcons.pen,
                   size: 30,
                   color: Colors.blue),  
                    ),
                    CupertinoButton(
                onPressed: () {
                  provider.deletecar(cars.id.toString());
                },
                child: const Icon(CupertinoIcons.delete,
                size: 30,
                color: Colors.redAccent,),
                ),
               ],
              )
             ]
            ),
           ),
          );  
         },  
       );
      }      
     ), 
    );
  } 
}


