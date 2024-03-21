import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home_security/core/utils/type_enum.dart';
import 'package:smart_home_security/features/domain/bloc/device_event.dart';
import 'package:smart_home_security/features/domain/enteties/device_entity.dart';
import 'package:smart_home_security/features/widget/components/device_card.dart';
import 'package:smart_home_security/features/widget/pages/camera_page.dart';
import 'package:smart_home_security/features/widget/pages/clock_page.dart';
import 'package:smart_home_security/features/widget/pages/led_page.dart';

class DeviceGrid extends StatelessWidget {
  final List<DeviceEntity> devices;
  final Bloc bloc;
  const DeviceGrid({super.key, required this.devices, required this.bloc});

  @override
  Widget build(BuildContext context) => GridView.builder(
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

          return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                bloc.add(DeleteDevice(device: devices[index]));
              },
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20.0),
                child: const Icon(Icons.delete),
              ),
              child:
                  DeviceCard(device: devices[index], icon: icon, page: page));
        },
      );
}
