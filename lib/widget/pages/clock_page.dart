import 'package:flutter/material.dart';

class ClockPage extends StatefulWidget {
  const ClockPage({super.key, this.pageTitile = "SmartHome"});

  final String pageTitile;
  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageTitile),
      ),
      body: const Center(
          child: Column(
        children: [
          Icon(
            Icons.alarm,
            size: 50,
          ),
        ],
      )),
    );
  }
}
