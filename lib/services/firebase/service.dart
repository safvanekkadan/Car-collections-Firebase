import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_wk1/model/cars_model.dart';

class FirebaseServices{

    final  CollectionReference car =
  FirebaseFirestore.instance.collection("car");
  
  Future<List<CarModel>> fetchCars()async{
    final snapshot =await car.get();
   return snapshot.docs.map((doc){
  return CarModel.fromMap(doc.data()as Map<String,dynamic>,doc.id);
   }).toList();
  }

  void deletecar(carId){
    car.doc(carId).delete();
  }

  void addCar(CarModel carModel){
    final data =carModel.toMap();
    car.add(data);
  }
  void updatedatas(CarModel carModel){
    final data =carModel.toMap();
    car.doc(car.id).update(data);
  }
}