import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class IIinput extends StatelessWidget {
  String? name;
  Widget? prefixIcon;
  Widget? suffixIcon;
  void Function(String)? onChanged;
  String? Function(String?)? validator;
  void Function(String?)? onSaved;
  int? maxiLine;
  TextInputType? iinputType;
  IIinput(
      {super.key,
      required this.name,
      this.onSaved,
      this.maxiLine,
      this.onChanged,
      this.validator,
      this.prefixIcon,
      this.suffixIcon,
      this.iinputType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      onSaved: onSaved,
      maxLines: maxiLine,
      keyboardType:iinputType ,
      decoration: InputDecoration(
          label: Text("$name"),
          hintText: '$name',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          // prefix: Icon(Icons.person),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          fillColor: Colors.green.shade50,
          filled: true),
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
