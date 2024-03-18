import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';
import 'package:smart_home_security/core/utils/type_enum.dart';
import 'package:smart_home_security/core/utils/utils.dart';
import 'package:smart_home_security/domain/entities/device_model.dart';

class Ledpage extends StatefulWidget {
  const Ledpage(
      {super.key, this.pageTitile = "SmartHome", required this.devModel});
  final String pageTitile;
  final DeviceModel devModel;
  @override
  State<Ledpage> createState() => _LedpageState();
}

class _LedpageState extends State<Ledpage> {
  Color _currentColor = const Color.fromARGB(255, 29, 30, 31);
  bool active = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageTitile),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Center(
            child: CircleColorPicker(
              strokeWidth: 16,
              onChanged: _onColorChanged,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Switch.adaptive(
            value: active,
            onChanged: (bool value) {
              setState(
                () {
                  active = value;
                  print(DeviceType.values.toString());
                },
              );
            },
          ),
        ],
      ),
    );
  }

  void _onColorChanged(Color color) {
    setState(() => _currentColor = color);
    //"172.20.10.6"
    setColor(_currentColor, widget.devModel.ip);
    //TODO убрать из функций принты
    if (kDebugMode) {
      print(_currentColor);
    }
  }
}
