/*

  Welcome to this project by ELI CORNELIUS BLUE MARKHAM!!!

  All logical flaws are due to a deficit of forethought...

 */

import 'package:flutter/material.dart';
import 'package:memo_deck/apps/notes.dart';
import 'package:memo_deck/ui_widgets/buttons.dart';
import 'package:memo_deck/ui_widgets/containers.dart';

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
                  window: const NotesApp()),
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
          child: SizedBox(
            height: 30,
            width: MediaQuery.of(context).size.width,
            child: EmbossedContainer(
                child: Row(
              children: [
                const SizedBox(
                  width: 5,
                ),
                EmbossedButton(
                    height: 25,
                    width: 80,
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
              ],
            )),
          ),
        ),
      ]),
    );
  }
}
