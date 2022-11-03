/*

  These button widgets are styled widgets that can be reused for buttony things.

  SettingsButton is your basic windows start button, does nothing yet but it has a nice animation.

  XButton is your stand close button, is animated and will close whatever context it is place in.

  DesktopIcon creates an icon button. give it a name, icon and a widget and when pressed it will open the widget.

*/

import 'package:flutter/material.dart';
import 'package:memo_deck/ui_widgets/containers.dart';

class SettingsButton extends StatefulWidget {
  const SettingsButton({
    Key? key,
  }) : super(key: key);

  @override
  State<SettingsButton> createState() => _SettingsButtonState();
}

class _SettingsButtonState extends State<SettingsButton> {
  bool invert = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: ((details) {
        setState(() {
          invert = true;
        });
      }),
      onTapUp: ((details) {
        setState(() {
          invert = false;
        });
      }),
      child: EmbossedContainer(
          invert: invert,
          height: 25,
          width: 80,
          child: Padding(
            padding: EdgeInsets.only(top: (invert) ? 1.0 : 0),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Image.asset('assets/icons/mdBiDi.png'),
                ),
                const Text(
                  'Settings',
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
              ],
            )),
          )),
    );
  }
}

class XButton extends StatefulWidget {
  const XButton({
    Key? key,
  }) : super(key: key);

  @override
  State<XButton> createState() => _XButtonState();
}

class _XButtonState extends State<XButton> {
  bool invert = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: ((details) {
        setState(() {
          invert = true;
        });
      }),
      onTapUp: ((details) {
        setState(() {
          invert = false;
        });
      }),
      onTap: () => Navigator.pop(context),
      child: EmbossedContainer(
          invert: invert,
          height: 15,
          width: 15,
          child: Padding(
            padding: EdgeInsets.only(top: (invert) ? 1.0 : 0),
            child: const Center(
                child: Text(
              'X',
              style: TextStyle(fontWeight: FontWeight.w900),
            )),
          )),
    );
  }
}

class DesktopIcon extends StatelessWidget {
  const DesktopIcon({
    Key? key,
    required this.icon,
    required this.name,
    required this.window,
  }) : super(key: key);

  final Widget icon;
  final String name;
  final Widget window;

  static const double labelSpacingTop = 5.0;
  static const double buttonPadding = 14;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(buttonPadding),
      child: GestureDetector(
          onTap: () =>
              showDialog(context: context, builder: (context) => window),
          child: Column(
            children: [
              icon,
              const SizedBox(height: labelSpacingTop),
              Text(
                name,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          )),
    );
  }
}
