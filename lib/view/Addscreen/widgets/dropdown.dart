import 'package:firebase_wk1/controller/cars_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/string/string.dart';

class carbrandselectvalues extends StatelessWidget {
  carbrandselectvalues({
    super.key,
    required this.carprovider,

    
  });
  final  CarsProvider carprovider;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextFormFieldRow(
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
                  scrollController: FixedExtentScrollController(initialItem: carprovider.selectedValue),
                  onSelectedItemChanged: (int index) {
                    
                     carprovider. selectedValue = index;

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