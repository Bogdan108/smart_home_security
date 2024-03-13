import 'package:flutter/material.dart';
import 'package:smart_home_security/domain/entities/device_model.dart';
import 'package:smart_home_security/widget/pages/led_page.dart';

class DeviceCard extends StatefulWidget {
  const DeviceCard({super.key, required this.device, required this.icon});
  final DeviceModel device;
  final IconData icon;

  @override
  State<DeviceCard> createState() => _DeviceCardState();
}

class _DeviceCardState extends State<DeviceCard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    bool active = false;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Ledpage(pageTitile: widget.device.name)),
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
              children: [
                Icon(
                  widget.icon,
                  size: 40,
                ),
                const SizedBox(width: 40),
                Switch.adaptive(
                  value: active,
                  onChanged: (bool value) {
                    setState(() {
                      active = value;
                    });
                    print(active);
                  },
                ),
              ],
            ),
            const SizedBox(height: 80),
            Align(
                alignment: Alignment.bottomLeft,
                child: Text(widget.device.name)),
          ],
        ),
      ),
    );
  }
}
