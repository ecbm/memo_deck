/*

  These button widgets are styled widgets that can be reused for buttony things.

  EmbossedButton is your basic windows start button, does nothing yet but it has a nice animation.

  XButton is your stand close button, is animated and will close whatever context it is place in.

  DesktopIcon creates an icon button. give it a name, icon and a widget and when pressed it will open the widget.

*/

import 'package:flutter/material.dart';
import 'package:memo_deck/ui_widgets/containers.dart';

class EmbossedButton extends StatefulWidget {
  const EmbossedButton({
    Key? key,
    required this.height,
    required this.width,
    this.ontap,
    required this.child,
  }) : super(key: key);

  final double height;
  final double width;
  final void Function()? ontap;
  final Widget child;

  @override
  State<EmbossedButton> createState() => _EmbossedButtonState();
}

class _EmbossedButtonState extends State<EmbossedButton> {
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
      onTap: widget.ontap,
      child: SizedBox(
        height: widget.height,
        width: widget.width,
        child: EmbossedContainer(
            invert: invert,
            child: Padding(
              padding: EdgeInsets.only(top: (invert) ? 1.0 : 0),
              child: Center(child: widget.child),
            )),
      ),
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
      child: SizedBox(
        height: 15,
        width: 15,
        child: EmbossedContainer(
            invert: invert,
            child: Padding(
              padding: EdgeInsets.only(top: (invert) ? 1.0 : 0),
              child: const Center(
                  child: Text(
                'X',
                style: TextStyle(fontWeight: FontWeight.w900),
              )),
            )),
      ),
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
          onTap: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    content: window,
                    contentPadding: EdgeInsets.zero,
                  )),
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
