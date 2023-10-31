import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/textfield.dart';

class UpdateUser extends StatefulWidget {
  const UpdateUser({super.key});

  @override
  State<UpdateUser> createState() => _AddUserState();
  
}

class _AddUserState extends State<UpdateUser> {
  
  List<String> items = [
  "Abarth","Alfa Romeo","Aston Martin","Audi","Bentley","BMW","Bugatti","Cadillac","Chevrolet",
  "Chrysler","Citroën","Dacia","Daewoo","Daihatsu","Dodge","Donkervoort","DS","Ferrari",
  "Fiat","Fisker","Ford","Honda","Hummer","Hyundai","Infiniti","Iveco","Jaguar","Jeep",
  "Kia","KTM","Lada","Lamborghini","Lancia","Land Rover","Landwind","Lexus","Lotus",
  "Maserati","Maybach","Mazda","McLaren","Mercedes-Benz","MG","Mini","Mitsubishi","Morgan",
  "Nissan","Opel","Peugeot","Porsche","Renault","Rolls-Royce","Rover","Saab","Seat",
  "Skoda","Smart","SsangYong","Subaru","Suzuki","Tesla","Toyota","Volkswagen","Volvo"
];
  int selectedValue =0;
    final  CollectionReference car =
  FirebaseFirestore.instance.collection("car");
  TextEditingController CarName =TextEditingController();
  TextEditingController CarBrand= TextEditingController();
  TextEditingController CarModel =TextEditingController();
  TextEditingController CarSpec =TextEditingController(); 

 updatedatas(carId){
  final data ={
    'carname':CarName.text,
    'carmodel':CarModel.text,
    'carspecification':CarSpec.text,
    'carbrand':items[selectedValue],
  };
  car.doc(carId).update(data).then((value) => Navigator.pop(context));
 }
  @override
  Widget build(BuildContext context) {
  final args= ModalRoute.of(context)!.settings.arguments as Map;
  CarName.text =args['carname'];
  items[selectedValue]= args['carbrand'];
  CarModel.text =args['carmodel'];
  CarSpec.text= args['carspecification'];
  final carId =args['id'];
    return Scaffold(
       appBar: AppBar(centerTitle: true,
        title:const Text("Update Car Datas",
        style: TextStyle(
           fontSize: 25,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
         
        ),),
      backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          children:  [ 
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoTextFormFieldRow(
                
                prefix:const Text("Select Car Brand"),
                placeholder:items[selectedValue],
                  decoration: BoxDecoration(             
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  readOnly: true,
                  controller: TextEditingController(text: items[selectedValue]),
                  onTap: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: 200,
                          child: CupertinoPicker(
                            itemExtent: 40,
                            onSelectedItemChanged: (int index) {
                              setState(() {
                                selectedValue = index;
                              });
                            },
                            children: items.map((String item) {
                              return Center(
                                child: Text(item),
                              );
                            }).toList(),
                          ),
                        );
                      }
                    );
                  }
              ),
            ),
           textfiled(labeltext: "Car name",controller:CarName ),
           textfiled(labeltext: "Model ",controller: CarModel,),
            textfiled(labeltext: "Specification",controller: CarSpec),
            const SizedBox(height: 20 ),
              CupertinoButton(
            onPressed: ()
            {
             print(args);
             updatedatas(carId);
              Navigator.pop(context);
            },
            child: Text("Update"),
            color: CupertinoColors.black,
            padding: EdgeInsets.all(10),
            disabledColor: Colors.grey,
          ) 
          ]
          
        ),
      ),
    );
  }
}

