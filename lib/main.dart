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
                window: const Window(
                  title: 'Notes',
                ),
              ),
              DesktopIcon(
                icon: Image.asset('assets/icons/people.png'),
                name: 'Contacts',
                window: const Window(
                  title: 'Contacts',
                ),
              ),
              DesktopIcon(
                icon: Image.asset('assets/icons/events.png'),
                name: 'Events',
                window: const Window(title: 'Events'),
              ),
              DesktopIcon(
                icon: Image.asset('assets/icons/healthtips.png'),
                name: 'Health tips',
                window: const Window(title: 'Health Tips'),
              ),
              DesktopIcon(
                icon: Image.asset('assets/icons/acronyms.png'),
                name: 'Acronyms',
                window: const Window(title: 'Acronyms'),
              ),
              DesktopIcon(
                icon: Image.asset('assets/icons/snippets.png'),
                name: 'Code Snippets',
                window: const Window(title: 'Code Snippets'),
              ),
              DesktopIcon(
                icon: Image.asset('assets/icons/documents.png'),
                name: 'Documents',
                window: const Window(title: 'Documents'),
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
