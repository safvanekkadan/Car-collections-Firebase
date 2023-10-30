import 'package:flutter/cupertino.dart';

class textfiled extends StatelessWidget {
  final String labeltext;
  const textfiled({
    super.key,
    required this.labeltext
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CupertinoTextField(placeholder:labeltext,
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