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
  DeviceType _deviceType = DeviceType.camera;

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
        final theme = Theme.of(context);
        return AlertDialog(
          title: const Text('Добавить устройство'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextFormField(
                  controller: _deviceNameController,
                  decoration: const InputDecoration(hintText: 'Имя устройства'),
                ),
                DropdownButton<DeviceType>(
                  value: _deviceType,
                  onChanged: (DeviceType? newValue) {
                    setState(() {
                      _deviceType = newValue!;
                    });
                  },
                  items: DeviceType.values
                      .map<DropdownMenuItem<DeviceType>>((DeviceType value) {
                    return DropdownMenuItem<DeviceType>(
                      value: value,
                      child: Text(value.toString().split('.').last),
                    );
                  }).toList(),
                ),
                TextFormField(
                  controller: _deviceIpController,
                  decoration:
                      const InputDecoration(hintText: 'IP адрес устройства'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Отмена',
                style: TextStyle(color: theme.colorScheme.inversePrimary),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'Добавить',
                style: TextStyle(color: theme.colorScheme.inversePrimary),
              ),
              onPressed: () {
                Provider.of<DeviceList>(context, listen: false).add(
                  DeviceModel(
                      name: _deviceNameController.text,
                      type: _deviceType,
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
