// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';

class textfiled extends StatelessWidget {
  final String labeltext;
  final TextEditingController controller;
  const textfiled({
    super.key,
    required this.labeltext,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: CupertinoTextField(
        
        clearButtonMode: OverlayVisibilityMode.editing,
        controller: controller,
        placeholder:labeltext,
        padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
           color: CupertinoColors.white,
           borderRadius: BorderRadius.circular(8.0),
           boxShadow: const [
             BoxShadow(
               color: CupertinoColors.systemGrey,
               blurRadius: 4.0,
               offset: Offset(2.0, 2.0),
             ),
           ],
         ),
          onChanged: (value) {
            print('Input:$value');
          },
         ),
    );
  }
}