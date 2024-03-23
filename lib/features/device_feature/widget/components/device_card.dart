import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home_security/features/device_feature/domain/bloc/switch_bloc/switch_bloc.dart';
import 'package:smart_home_security/features/device_feature/domain/bloc/switch_bloc/switch_event.dart';
import 'package:smart_home_security/features/device_feature/domain/bloc/switch_bloc/switch_state.dart';
import 'package:smart_home_security/features/device_feature/domain/enteties/device_entity.dart';

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
  late final SwitchBloc switchBloc;

  @override
  void initState() {
    super.initState();
    switchBloc = SwitchBloc(
      initialState: SwitchEmpty(isActive: widget.device.state),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget.page),
        ).then(
          (value) => switchBloc.add(
            SwitchDevice(
              state: value,
              needToSave: false,
            ),
          ),
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
                Center(
                  child: BlocBuilder<SwitchBloc, SwitchState>(
                    bloc: switchBloc,
                    builder: (context, state) {
                      if (state is! SwitchLoadingError) {
                        return Switch.adaptive(
                          value: state.isActive,
                          onChanged: (bool value) {
                            switchBloc.add(
                              SwitchDevice(
                                  needToSave: true, state: !state.isActive),
                            );
                          },
                        );
                      } else {
                        return Center(child: ErrorWidget(Exception()));
                      }
                    },
                  ),
                )
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
