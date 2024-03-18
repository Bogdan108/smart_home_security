import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_security/core/utils/type_enum.dart';
import 'package:smart_home_security/core/utils/widget_list.dart';
import 'package:smart_home_security/features/domain/entities/device_model.dart';
import 'package:smart_home_security/features/widget/components/add_device_dialog.dart';
import 'package:smart_home_security/features/widget/components/device_card.dart';
import 'package:smart_home_security/features/widget/pages/camera_page.dart';
import 'package:smart_home_security/features/widget/pages/clock_page.dart';
import 'package:smart_home_security/features/widget/pages/led_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    UnmodifiableListView<DeviceModel> devices =
        Provider.of<DeviceList>(context, listen: true).devices;
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Добрый вечер, Богдан',
                    style: TextStyle(fontSize: 20),
                  ),
                  AddDeviceButton(),
                ],
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: devices.length,
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 15),
              itemBuilder: (BuildContext context, int index) {
                IconData icon;
                Widget page;
                switch (devices[index].type) {
                  case DeviceType.camera:
                    icon = Icons.camera_alt_outlined;
                    page = CameraPage(devModel: devices[index]);
                    break;
                  case DeviceType.led:
                    icon = Icons.lightbulb_outline_sharp;
                    page = Ledpage(
                      devModel: devices[index],
                    );
                    break;
                  case DeviceType.clock:
                    icon = Icons.watch_later_outlined;
                    page = const ClockPage();
                    break;
                }

                return DeviceCard(
                    device: devices[index], icon: icon, page: page);
              },
            ),
          ),
        ],
      ),
    );
  }
}
