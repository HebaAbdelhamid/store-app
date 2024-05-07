import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({

    required TextEditingController titleEditingController,
    required this.title,
    required this.onsaved,

  }) : _titleEditingController = titleEditingController;

  final TextEditingController _titleEditingController;
  String title;
  Function onsaved;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: (value){
        _titleEditingController.text=value!;
      },
      controller:_titleEditingController,
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
          label:Text('${title}'),
          border: OutlineInputBorder(
            borderSide:BorderSide(color: Color(0xff1919b4)) ,borderRadius: BorderRadius.circular(7),
          )),
    );
  }
}