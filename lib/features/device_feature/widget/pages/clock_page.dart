import 'package:flutter/material.dart';

class ClockPage extends StatefulWidget {
  const ClockPage({super.key});

  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  TimeOfDay _alarmTime = TimeOfDay.now();
  TimeOfDay _time = TimeOfDay.now();
  bool _isLampOn = false;
  bool _isAlarmOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alarm with Sunrise'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/lamp_image.png",
                  scale: 1.8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Turn Lamp: '),
                    Switch.adaptive(
                      value: _isLampOn,
                      onChanged: (value) {
                        setState(() {
                          _isLampOn = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Turn Alarm: '),
                    Switch.adaptive(
                      value: _isAlarmOn,
                      onChanged: (value) {
                        setState(() {
                          _isAlarmOn = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text('Set Alarm Time'),
                OutlinedButton(
                  onPressed: () {
                    showTimePicker(
                      context: context,
                      initialTime: _alarmTime,
                    ).then((value) {
                      if (value != null) {
                        setState(() {
                          _alarmTime = value;
                        });
                      }
                    });
                  },
                  child: const Text('Set Time'),
                ),
                const SizedBox(height: 20),
                Text('Alarm Time: ${_alarmTime.format(context)}'),
                const SizedBox(
                  height: 50,
                ),
                const Text('Set Time'),
                OutlinedButton(
                  onPressed: () {
                    showTimePicker(
                      context: context,
                      initialTime: _time,
                    ).then((value) {
                      if (value != null) {
                        setState(() {
                          _time = value;
                        });
                      }
                    });
                  },
                  child: const Text('Set Time'),
                ),
                const SizedBox(height: 20),
                Text('Actual Time: ${_time.format(context)}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
