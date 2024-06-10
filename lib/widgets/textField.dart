import 'package:flutter/material.dart';

class txtField extends StatelessWidget {
  const txtField({super.key, required this.label,required this.txt, required this.ob});
  final bool ob;
  final String label;
  final TextEditingController? txt;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: GlobalKey<FormState>(),
      child: TextFormField(
        obscureText: ob,
        autovalidateMode: AutovalidateMode.always,
        validator: (val){
          if (val!.isEmpty){return 'field is required';}
        },
        style: const TextStyle(color: Colors.white),
        controller: txt,
        decoration: InputDecoration(
            label: Text(label, style: const TextStyle(color: Colors.white)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.white, width: 2)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.white, width: 2)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.white))),
      ),
    );
  }
}
