import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumericTextField extends StatefulWidget {
  final TextEditingController controller;

  const NumericTextField({super.key, required this.controller});

  @override
  State<NumericTextField> createState() => _NumericTextFieldState();
}

class _NumericTextFieldState extends State<NumericTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: const InputDecoration(
        labelText: 'Alter',
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      ],
    );
    // TextFormField(
    //   controller: controller,
    //   keyboardType: TextInputType.number,
    //   inputFormatters: <TextInputFormatter>[
    //     FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
    //   ],
    //   decoration: const InputDecoration(
    //     contentPadding: EdgeInsets.all(10),
    //     icon: Icon(Icons.calendar_month_rounded),
    //     iconColor: Colors.black,
    //     border: OutlineInputBorder(),
    //     hintText: 'Alter',
    //     enabledBorder: UnderlineInputBorder(
    //       borderSide: BorderSide(color: Colors.deepOrange),
    //     ),
    //     focusedBorder: UnderlineInputBorder(
    //       borderSide: BorderSide(color: Colors.deepOrange),
    //     ),
    //   ),
    // );
  }
}
