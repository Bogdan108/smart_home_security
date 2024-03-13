import 'package:flutter/material.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';

class Ledpage extends StatefulWidget {
  const Ledpage({super.key, required this.pageTitile});
  final String pageTitile;
  @override
  State<Ledpage> createState() => _LedpageState();
}

class _LedpageState extends State<Ledpage> {
  Color _currentColor = const Color.fromARGB(255, 29, 30, 31);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageTitile),
      ),
      body: Center(
        child: CircleColorPicker(
          strokeWidth: 16,
          onChanged: _onColorChanged,
        ),
      ),
    );
  }

  void _onColorChanged(Color color) {
    setState(() => _currentColor = color);
    print(_currentColor);
  }
}
