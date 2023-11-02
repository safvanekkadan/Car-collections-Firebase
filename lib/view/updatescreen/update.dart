import 'package:firebase_wk1/constants/string/string.dart';
import 'package:firebase_wk1/controller/cars_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/textfield.dart';

class UpdateUser extends StatelessWidget {
  const UpdateUser({super.key});

  @override
  Widget build(BuildContext context) {
    final carprovider =Provider.of<CarsProvider>(context);
  final args= ModalRoute.of(context)!.settings.arguments as Map;
  carprovider.CarName.text =args['carname'];
  items[carprovider.selectedValue]= args['carbrand'];
  carprovider.Carmodel.text =args['carmodel'];
  carprovider.CarSpec.text= args['carspecification'];
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
                placeholder:items[carprovider.selectedValue],
                  decoration: BoxDecoration(             
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  readOnly: true,
                  controller: TextEditingController(text: items[carprovider.selectedValue]),
                  onTap: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: 200,
                          child: CupertinoPicker(
                            itemExtent: 40,
                            onSelectedItemChanged: (int index) {
                              
                                carprovider.selectedValue = index;
                              
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
           textfiled(labeltext: "Car name",controller:carprovider.CarName ),
           textfiled(labeltext: "Model ",controller: carprovider.Carmodel,),
            textfiled(labeltext: "Specification",controller: carprovider.CarSpec),
            const SizedBox(height: 20 ),
              CupertinoButton(
            onPressed: ()
            {
             carprovider.CarBrand.clear();
             carprovider.CarName.clear();
             carprovider.Carmodel.clear();
             carprovider.CarSpec.clear();
             carprovider.updatedatas(carId);
              Navigator.pop(context);
            },
            color: CupertinoColors.black,
            padding: const EdgeInsets.all(10),
            disabledColor: Colors.grey,
            child: const Text("Update"),
          ) 
          ]
          
        ),
      ),
    );
  }
}

