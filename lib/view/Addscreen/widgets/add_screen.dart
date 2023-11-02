import 'package:firebase_wk1/controller/cars_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/string/string.dart';

class carbrandselectvalues extends StatelessWidget {
  carbrandselectvalues({
    super.key,
    required this.carsProvider,
  });
  final  CarsProvider carsProvider;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextFormFieldRow(
      prefix:const Text("Select Car Brand"),
      placeholder:items[carsProvider.selectedValue],
        decoration: BoxDecoration(             
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        readOnly: true,
        controller: TextEditingController(text: items[carsProvider.selectedValue]),
        onTap: () {
          showCupertinoModalPopup(
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                height: 200,
                child: CupertinoPicker(
                  itemExtent: 40,
                  onSelectedItemChanged: (int index) {
                    
                     carsProvider. selectedValue = index;

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
    );
  }
}