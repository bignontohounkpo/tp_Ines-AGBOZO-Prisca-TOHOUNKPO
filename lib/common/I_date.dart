import 'package:flutter/material.dart';

class IDate extends StatelessWidget {
  String? name;

  void Function(String)? onChanged;
  String? Function(String?)? validator;
  void Function(String?)? onSaved;


  IDate({super.key,required this.name, this.onSaved, this.onChanged,this.validator});

  @override
  Widget build(BuildContext context) {
    return      ListTile(

      trailing: Icon(Icons.calendar_month),
      onTap: () async {
        var bookPeriod= await   showDateRangePicker(
            context: context,
            firstDate: DateTime.now(),
            lastDate: DateTime(2023, 01));
        print(bookPeriod);
      },
    );
  }
}
