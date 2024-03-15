import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';
import 'package:smart_home_security/core/utils/utils.dart';

class Ledpage extends StatefulWidget {
  const Ledpage({super.key, this.pageTitile = "SmartHome"});
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
    setColor(_currentColor, "172.20.10.4");
    //TODO убрать из функций принты
    if (kDebugMode) {
      print(_currentColor);
    }
  }
}
