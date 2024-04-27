
import 'package:tp_ines_prisca/common/IButton.dart';
import 'package:tp_ines_prisca/common/IIinput.dart';
import 'package:tp_ines_prisca/models/person.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
class CandidatFormPage extends StatefulWidget {
  const CandidatFormPage({super.key});

  @override
  State<CandidatFormPage> createState() => _CandidatFormPageState();
}

class _CandidatFormPageState extends State<CandidatFormPage> {
  final _formKey = GlobalKey<FormState>();
  final Person person= Person();
  List <File> files = [];
  String? imagePath;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        imagePath = pickedFile.path;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Creation de candidats 🇧🇯🇧🇯"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [





              GestureDetector(
                onTap: () {
                  _pickImage(ImageSource.gallery);
                },
                child: Container(
                  child: Text("choisissez une image"),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(

                    image: DecorationImage(
                      image: imagePath != null
                          ? FileImage(File(imagePath!))
                          : AssetImage('assets/images/default_image.jpg')
                      as ImageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),


              IIinput(
                name: 'Nom',
iinputType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return " Champ obligatoire";
                  }
                },
                onSaved: (value) {

                 // print("Valeur à sauvegarder $value");
                  person.name=value;

                },

                prefixIcon: Icon(Icons.person),
              ),
             SizedBox(height: 10,),
              IIinput(
                name: 'Prenom',
iinputType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return " Champ obligatoire";
                  }
                },
                onSaved: (value) {

                  // print("Valeur à sauvegarder $value");
                  person.surname=value;

                },

                prefixIcon: Icon(Icons.person),
              ),
              SizedBox(height: 10,),
              IIinput(
                maxiLine: 3,
                name: 'Desccription',
                prefixIcon: Icon(Icons.error_outline),
iinputType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return " Champ obligatoire";
                  }
                },
                onSaved: (value) {

                  // print("Valeur à sauvegarder $value");
                  person.bibliography=value;

                },

              ),

              SizedBox(height: 10,),

              IIinput(
                maxiLine: 3,
                name: 'Parti politique',
                prefixIcon: Icon(Icons.flag),
                iinputType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return " Champ obligatoire";
                  }
                },
                onSaved: (value) {

                  // print("Valeur à sauvegarder $value");
                  person.parti=value;

                },

              ),

              SizedBox(height: 10,),

              ListTile(
                title: Text("Date de naissance"),
                trailing: Icon(Icons.calendar_month),
    onTap: () async {
      DateTime? selectedDate = await showDatePicker(
        cancelText: "Annuler",
        confirmText: "Confirmer",
        barrierColor: Colors.green.shade50,
        context: context,
        firstDate: DateTime(1990),
        lastDate: DateTime.now(),
      );
    }
              ),

          ],

          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: IButton(
          onPressed: () {
          if(  _formKey.currentState!.validate()){
            _formKey.currentState!.save();
           Navigator.pop(context, person);
          }
          },
          text: "Sauvegarder",
        ),
      ),
    );
  }
}
