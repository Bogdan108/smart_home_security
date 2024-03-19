import 'package:flutter/material.dart';
import 'package:smart_home_security/features/domain/enteties/device_entity.dart';

class DeviceCard extends StatefulWidget {
  const DeviceCard(
      {super.key,
      required this.device,
      required this.icon,
      required this.page});
  final DeviceEntity device;
  final IconData icon;
  final Widget page;
  @override
  State<DeviceCard> createState() => _DeviceCardState();
}

class _DeviceCardState extends State<DeviceCard> {
  bool active = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget.page),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  widget.icon,
                  size: 40,
                ),
                Switch.adaptive(
                  value: active,
                  onChanged: (bool value) {
                    setState(() {
                      active = value;
                    });
                  },
                ),
              ],
            ),
            const Flexible(
              child: SizedBox(height: 80),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(widget.device.name),
            ),
          ],
        ),
      ),
    );
  }
}
