/*

  These container widgets are styled widgets that can be reused to contain app content.

  EmbossedContainer adds the classic white and black embossed look with a gray background. takes width, height and a child widget.

  Window is a basic windows 98 window container with a close button. takes a title and child widget.

*/

import 'package:flutter/material.dart';
import 'package:memo_deck/ui_widgets/buttons.dart';

class EmbossedContainer extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  final bool invert;
  const EmbossedContainer(
      {Key? key,
      required this.child,
      required this.height,
      required this.width,
      this.invert = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color colorA = (invert) ? Colors.black54 : Colors.white70;
    Color colorB = (!invert) ? Colors.black54 : Colors.white70;
    return Material(
      shape: Border(
        right: BorderSide(
          width: 2,
          color: colorB,
        ),
        left: BorderSide(
          width: 2,
          color: colorA,
        ),
        bottom: BorderSide(
          width: 2,
          color: colorB,
        ),
        top: BorderSide(
          width: 2,
          color: colorA,
        ),
      ),
      child: Container(
          height: height,
          width: width,
          color: const Color.fromARGB(255, 180, 180, 180),
          child: child),
    );
  }
}

class Window extends StatelessWidget {
  const Window({super.key, this.title});

  final String? title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: EmbossedContainer(
          height: MediaQuery.of(context).size.width,
          width: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  height: 20,
                  width: MediaQuery.of(context).size.width,
                  color: const Color.fromARGB(255, 9, 21, 122),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 12,
                      ),
                      Text((title != null) ? title! : 'error: title not set',
                          style: const TextStyle(color: Colors.white)),
                      const Spacer(),
                      const XButton(),
                      const SizedBox(
                        width: 3,
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
