import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MEMO DECK',
      theme: ThemeData(
        fontFamily: 'Windows',
      ),
      home: const Desktop(),
    );
  }
}

class Desktop extends StatefulWidget {
  const Desktop({super.key});

  @override
  State<Desktop> createState() => _DesktopState();
}

class _DesktopState extends State<Desktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 55, 126, 127),
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.only(top: 14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DesktopIcon(
                icon: Image.asset('assets/icons/notes.png'),
                name: 'Notes',
              ),
              DesktopIcon(
                icon: Image.asset('assets/icons/people.png'),
                name: 'Contacts',
              ),
              DesktopIcon(
                icon: Image.asset('assets/icons/events.png'),
                name: 'Events',
              ),
              DesktopIcon(
                icon: Image.asset('assets/icons/healthtips.png'),
                name: 'Health tips',
              ),
              DesktopIcon(
                icon: Image.asset('assets/icons/acronyms.png'),
                name: 'Acronyms',
              ),
              DesktopIcon(
                icon: Image.asset('assets/icons/snippets.png'),
                name: 'Code Snippets',
              ),
              DesktopIcon(
                icon: Image.asset('assets/icons/documents.png'),
                name: 'documents',
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: EmbossedContainer(
              height: 30,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: const [
                  SizedBox(
                    width: 5,
                  ),
                  SettingsButton(),
                ],
              )),
        ),
      ]),
    );
  }
}

class DesktopIcon extends StatelessWidget {
  const DesktopIcon({
    Key? key,
    required this.icon,
    required this.name,
  }) : super(key: key);

  final Widget icon;
  final String name;

  static const double labelSpacingTop = 5.0;
  static const double buttonPadding = 14;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(buttonPadding),
      child: GestureDetector(
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
    Color colorA = (invert) ? Colors.black : Colors.white;
    Color colorB = (!invert) ? Colors.black : Colors.white;
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
          color: const Color.fromARGB(255, 198, 198, 198),
          child: child),
    );
  }
}
