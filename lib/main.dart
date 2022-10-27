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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 55, 126, 127),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Image.asset('assets/icons/notes.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Image.asset('assets/icons/people.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Image.asset('assets/icons/events.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Image.asset('assets/icons/healthtips.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Image.asset('assets/icons/acronyms.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Image.asset('assets/icons/snippets.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Image.asset('assets/icons/documents.png'),
          ),
          const Spacer(),
          EmbossedContainer(
              height: 30,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  EmbossedContainer(
                      height: 25,
                      width: 80,
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Image.asset('assets/icons/mdBiDi.png'),
                          ),
                          const Text(
                            'Start',
                            style: TextStyle(fontWeight: FontWeight.w900),
                          ),
                        ],
                      ))),
                ],
              )),
        ],
      ),
    );
  }
}

class EmbossedContainer extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  const EmbossedContainer(
      {Key? key,
      required this.child,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const Border(
        right: BorderSide(
          width: 2,
          color: Colors.black,
        ),
        left: BorderSide(
          width: 2,
          color: Colors.white,
        ),
        bottom: BorderSide(
          width: 2,
          color: Colors.black,
        ),
        top: BorderSide(
          width: 2,
          color: Colors.white,
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
