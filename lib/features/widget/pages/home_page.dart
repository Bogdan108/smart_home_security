import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home_security/common/widget/custom_error_widget.dart';
import 'package:smart_home_security/common/widget/custom_loading_indicator.dart';
import 'package:smart_home_security/core/utils/type_enum.dart';
import 'package:smart_home_security/features/domain/bloc/device_event.dart';
import 'package:smart_home_security/features/domain/bloc/device_state.dart';
import 'package:smart_home_security/features/domain/bloc/devices_bloc.dart';
import 'package:smart_home_security/features/domain/enteties/device_entity.dart';
import 'package:smart_home_security/features/widget/components/device_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final Bloc bloc;
  final TextEditingController _deviceNameController = TextEditingController();
  final TextEditingController _deviceIpController = TextEditingController();
  DeviceType _deviceType = DeviceType.camera;

  @override
  void initState() {
    bloc = BlocProvider.of<DeviceBloc>(context);
    bloc.add(LoadDevices());
    super.initState();
  }

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
                StatefulBuilder(
                  builder: (BuildContext context, setState) {
                    return DropdownButton<DeviceType>(
                      value: _deviceType,
                      onChanged: (DeviceType? newValue) {
                        setState(() {
                          _deviceType = newValue!;
                        });
                      },
                      items: DeviceType.values
                          .map<DropdownMenuItem<DeviceType>>(
                              (DeviceType value) {
                        return DropdownMenuItem<DeviceType>(
                          value: value,
                          child: Text(value.toString().split('.').last),
                        );
                      }).toList(),
                    );
                  },
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
                bloc.add(AddDevices(
                    device: DeviceEntity(
                        name: _deviceNameController.text,
                        type: _deviceType,
                        ip: _deviceIpController.text,
                        state: false,
                        roomId: 1,
                        id: 1)));

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
    final theme = Theme.of(context);

    return Scaffold(
        backgroundColor: theme.colorScheme.background,
        appBar: AppBar(
          title: const Text("Smart Home"),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                // Действие при нажатии на иконку
              },
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            bloc.add(LoadDevices());
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Добрый вечер, Богдан',
                        style: TextStyle(fontSize: 20),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          _showAddDeviceDialog();
                        },
                        child: const Icon(
                          Icons.add,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: BlocBuilder<DeviceBloc, DeviceState>(
                  builder: (context, state) => switch (state) {
                    DevicesEmpty() => const CustomLoadingIndicator(),
                    DevicesLoading() => const CustomLoadingIndicator(),
                    DevicesLoaded() => DeviceGrid(
                        devices: state.devices,
                        bloc: bloc,
                      ),
                    DevicesAdded() => DeviceGrid(
                        devices: state.devices,
                        bloc: bloc,
                      ),
                    DevicesLoadingError() => CustomErrorWidget(state.exception),
                    DevicesDeleted() => DeviceGrid(
                        devices: state.devices,
                        bloc: bloc,
                      ),
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
