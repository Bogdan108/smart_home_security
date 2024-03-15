import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ClockPage extends StatefulWidget {
  const ClockPage({super.key, this.pageTitile = "SmartHome"});

  final String pageTitile;
  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  bool active = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageTitile),
      ),
      body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Image.asset(
                  "assets/images/lamp_image.png",
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Flexible(
                child: Switch.adaptive(
                  value: active,
                  onChanged: (bool value) {
                    setState(() {
                      active = value;
                    });
                  },
                ),
              )
            ],
          )),
    );
  }
}
