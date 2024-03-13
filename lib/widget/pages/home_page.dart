import 'package:flutter/material.dart';
import 'package:smart_home_security/domain/entities/device_model.dart';
import 'package:smart_home_security/widget/components/device_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List<Device> devices = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: const [
        Row(
          children: [
            DeviceCard(device: DeviceModel(name: "Lamp"), icon: Icons.lightbulb)
          ],
        )
      ],
    ));
  }
}
