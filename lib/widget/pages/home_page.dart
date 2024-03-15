import 'package:flutter/material.dart';
import 'package:smart_home_security/domain/entities/device_model.dart';
import 'package:smart_home_security/widget/components/device_card.dart';
import 'package:smart_home_security/widget/pages/camera_page.dart';
import 'package:smart_home_security/widget/pages/clock_page.dart';
import 'package:smart_home_security/widget/pages/led_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DeviceCard> devices = [
    const DeviceCard(
        device: DeviceModel(name: "Lamp"),
        icon: Icons.lightbulb,
        page: Ledpage(
          pageTitile: "Lamp",
        )),
    const DeviceCard(
        device: DeviceModel(name: "Clock"),
        icon: Icons.alarm,
        page: ClockPage()),
    const DeviceCard(
        device: DeviceModel(name: "Camera"),
        icon: Icons.photo_camera_outlined,
        page: CameraPage()),
  ];

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
      body: GridView.builder(
          itemCount: devices.length,
          padding: const EdgeInsets.all(12),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 15),
          itemBuilder: (BuildContext context, int index) => devices[index]),
    );
  }
}
