import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_security/core/utils/type_enum.dart';
import 'package:smart_home_security/core/utils/widget_list.dart';
import 'package:smart_home_security/domain/entities/device_model.dart';

class AddDeviceButton extends StatefulWidget {
  const AddDeviceButton({super.key});

  @override
  State<AddDeviceButton> createState() => _AddDeviceButtonState();
}

class _AddDeviceButtonState extends State<AddDeviceButton> {
  final TextEditingController _deviceNameController = TextEditingController();
  final TextEditingController _deviceIpController = TextEditingController();
  String _deviceType = 'Тип 1';

  @override
  void dispose() {
    _deviceNameController.dispose();
    _deviceIpController.dispose();
    super.dispose();
  }

  void _showAddDeviceDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Добавить устройство'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextFormField(
                  controller: _deviceNameController,
                  decoration:
                      const InputDecoration(hintText: 'Введите имя устройства'),
                ),
                DropdownButton<String>(
                  value: _deviceType,
                  onChanged: (String? newValue) {
                    setState(() {
                      _deviceType = newValue!;
                    });
                  },
                  items: <String>['Тип 1', 'Тип 2', 'Тип 3']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                TextFormField(
                  controller: _deviceIpController,
                  decoration: const InputDecoration(
                      hintText: 'Введите IP адрес устройства'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Отмена'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Добавить'),
              onPressed: () {
                // Здесь может быть код для добавления устройства
                print(
                    'Имя устройства: ${_deviceNameController.text}, Тип: $_deviceType, IP: ${_deviceIpController.text}');
                Provider.of<DeviceList>(context, listen: false).add(
                  DeviceModel(
                      name: _deviceNameController.text,
                      type: DeviceType.camera,
                      ip: _deviceIpController.text),
                );
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
      onPressed: () {
        _showAddDeviceDialog();
      },
      child: const Icon(
        Icons.add,
      ),
    ));
  }
}
