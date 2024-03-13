import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    final theme = Theme.of(context);
    return Scaffold(
        backgroundColor: theme.colorScheme.background,
        appBar: AppBar(
          title: const Text("Smart Home"),
        ),
        body: ListView(
          padding: const EdgeInsets.all(12),
          children: const [
            Row(
              children: [
                Flexible(
                  child: DeviceCard(
                      device: DeviceModel(name: "Lamp"), icon: Icons.lightbulb),
                ),
                SizedBox(width: 20),
                Flexible(
                  child: DeviceCard(
                      device: DeviceModel(name: "Clock"),
                      icon: Icons.watch_later_outlined),
                )
              ],
            )
          ],
        ));
  }
}
