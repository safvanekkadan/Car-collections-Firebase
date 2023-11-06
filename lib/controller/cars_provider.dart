// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_wk1/constants/string/string.dart';
import 'package:firebase_wk1/model/cars_model.dart';
import 'package:firebase_wk1/services/firebase/service.dart';
import 'package:flutter/material.dart';

class CarsProvider extends ChangeNotifier{
final FirebaseServices  firebaseservice = FirebaseServices();
 int selectedValue =0;

  TextEditingController CarName =TextEditingController();
  TextEditingController CarBrand= TextEditingController();
  TextEditingController Carmodel =TextEditingController();
  TextEditingController CarSpec =TextEditingController(); 

  List<CarModel> listcars =[];

  CarsProvider(){
    fetchCars();
  }

 Future<void> fetchCars()async{
  listcars =await firebaseservice.fetchCars();
  notifyListeners();
 }

 Future<void> deletecar(String carId)async{
  firebaseservice.deletecar(carId);
  await fetchCars();
  notifyListeners();
 }
  
  void  SetSelectedvalue(String index){
    selectedValue =index as int;//index or value 
    notifyListeners();
  }
  void addCar()async{
    final car =CarModel(
      id: '', 
      carname: CarName.text, 
      carbrand: items[selectedValue],
      carmodel: Carmodel.text, 
      carspecification: CarSpec.text);
      firebaseservice.addCar(car);
      await fetchCars();
      notifyListeners();
  }

  void updatedatas(String carId)async{
  FirebaseFirestore.instance.collection('car').doc(carId).update({
    'id': carId, 
      'carname': CarName.text, 
      'carbrand': items[selectedValue], 
      'carmodel': Carmodel.text, 
      'carspecification': CarSpec.text
  });
 
    // final car=CarModel(
      // id: carId, 
      // carname: CarName.text, 
      // carbrand: CarBrand.text, 
      // carmodel: Carmodel.text, 
      // carspecification: CarSpec.text);
      //firebaseservice.updatedatas(car);
      await fetchCars();
      notifyListeners();
  }
}