class CarModel {
  String?id;
  String?carname;
  String?carbrand;
  String?carmodel;
  String?carspecification;

  CarModel({
    required this.id,
    required this.carname,
    required this.carbrand,
    required this.carmodel,
    required this.carspecification
  });

factory CarModel.fromMap(Map<String,dynamic>map,String id){
  return CarModel(
    id: id, 
    carname: map['carname']??'', 
    carbrand: map['carbrand']??'', 
    carmodel: map['carmodel']??'', 
    carspecification: map['carspecification']??''
    );
}
   Map<String,dynamic>toMap(){
    return {
      'carname':carname,
      'carbrand':carbrand,
      'carmodel':carmodel,
      'carspecification':carspecification
    };
   }  
}