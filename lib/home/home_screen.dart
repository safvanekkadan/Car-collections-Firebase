import 'package:firebase_wk1/Addscreen/add_screen.dart';
import 'package:firebase_wk1/constants/string/string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatelessWidget {

 HomeScreen({super.key});

  final  CollectionReference car =
  FirebaseFirestore.instance.collection("car");

  void deletecar(carId){
    car.doc(carId).delete();
  }
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
        MaterialPageRoute(builder: (context)=> const AddUser()));
          },
        backgroundColor: Colors.blueGrey,
        child: const Icon(Icons.add,
        size: 22,),
        
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    body: StreamBuilder(
      stream: car.snapshots(),
     builder: (context,AsyncSnapshot snapshot) {
       if(snapshot.hasData){
       return ListView.builder(
        itemCount:snapshot.data!.docs.length,
        itemBuilder:(context, index) {
          final DocumentSnapshot carnameSnap= snapshot.data.docs[index];
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
                    Text(carnameSnap['carbrand'],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),),
                    Text(carnameSnap['carname'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),),
                    Text(carnameSnap['carmodel'],
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),),
                    Text(carnameSnap['carspecification'],
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
              'carname':carnameSnap['carname'],
              'carbrand':carnameSnap['carbrand'],
              'carmodel':carnameSnap['carmodel'],
              'carspecification':carnameSnap['carspecification'],
              'id':carnameSnap.id,
             } );      
                  
              },
              child: const Icon(CupertinoIcons.pen,
              size: 30,
              color: Colors.blue),
              
            ),
                  CupertinoButton(
              onPressed: () {
                deletecar(carnameSnap.id);
              },
              child: const Icon(CupertinoIcons.delete,
              size: 30,
              color: Colors.redAccent,),
            ),
          
                ],
          
              )
                ]),
            ),
          );
          
        },  
        );
       }
       return Container();
     },),
    );
  }
}

