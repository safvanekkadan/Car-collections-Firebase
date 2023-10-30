import 'package:firebase_wk1/Addscreen/add_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        title:const Text("Collections",
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
         
        ),),
        backgroundColor: Colors.grey,
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
    
    );
  }
}