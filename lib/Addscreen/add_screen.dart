import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/textfield.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
  
}

class _AddUserState extends State<AddUser> {
  
  List<String> items = [
  "Abarth","Alfa Romeo","Aston Martin","Audi","Bentley","BMW","Bugatti","Cadillac","Chevrolet",
  "Chrysler","Citroën","Dacia","Daewoo","Daihatsu","Dodge","Donkervoort","DS","Ferrari",
  "Fiat","Fisker","Ford","Honda","Hummer","Hyundai","Infiniti","Iveco","Jaguar","Jeep",
  "Kia","KTM","Lada","Lamborghini","Lancia","Land Rover","Landwind","Lexus","Lotus",
  "Maserati","Maybach","Mazda","McLaren","Mercedes-Benz","MG","Mini","Mitsubishi","Morgan",
  "Nissan","Opel","Peugeot","Porsche","Renault","Rolls-Royce","Rover","Saab","Seat",
  "Skoda","Smart","SsangYong","Subaru","Suzuki","Tesla","Toyota","Volkswagen","Volvo"
];
  int selectedValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(centerTitle: true,
        title:const Text("Add Car",
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
         
        ),),
        backgroundColor: Colors.grey,
      ),
      body: SafeArea(
        child: Column(
          children:  [ 
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoTextFormFieldRow(
                prefix:Text("Select Car Brand") ,
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
          const textfiled(labeltext: "Car name"),
           const textfiled(labeltext: "Model "),
           const textfiled(labeltext: "Specification"),
           const SizedBox(height: 20 ),
              CupertinoButton(
            onPressed: ()
            {},
            child: Text("Submit"),
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

