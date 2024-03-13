import 'package:flutter/material.dart';
import 'package:smart_home_security/domain/entities/device_model.dart';

class DeviceCard extends StatelessWidget {
  const DeviceCard({super.key, required this.device, required this.icon});
  final DeviceModel device;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) =>
        //           NewsDetailPage(news: news, isFavourite: isFavourite)),
        // );
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
        child: Row(
          children: [
            // Flexible(
            //   child: NewsCacheImage(
            //     width: 220,
            //     height: 160,
            //     news.urlToImage,
            //     fit: BoxFit.fill,
            //   ),
            // ),
            const SizedBox(width: 16),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(device.name, style: theme.textTheme.titleMedium),
                  const SizedBox(height: 16),
                  Icon(icon),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
