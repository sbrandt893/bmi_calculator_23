import 'package:flutter/material.dart';

class CustomDropdownButton extends StatefulWidget {
  final List<String> dropdownItems;
  final String selectedItem;
  final IconData icon;

  const CustomDropdownButton({
    required this.dropdownItems,
    required this.selectedItem,
    required this.icon,
    super.key,
  });

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  late String selectedDropdownItem;

  @override
  void initState() {
    super.initState();
    selectedDropdownItem = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedDropdownItem,
      icon: Icon(widget.icon),
      elevation: 20,
      style: const TextStyle(color: Colors.deepPurple),
      onChanged: (String? value) {
        setState(() {
          selectedDropdownItem = value!;
        });
      },
      items: widget.dropdownItems.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: const TextStyle(fontSize: 20)),
        );
      }).toList(),
    );
  }
}
