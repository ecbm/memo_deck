import 'package:flutter/material.dart';
import 'package:memo_deck/apps/notes.dart';
import 'package:memo_deck/ui_widgets/containers.dart';

class PageProvider extends ChangeNotifier {
  int _index = 0;

  final List<Widget> _pages = [
    Container(),
    const NotesApp(),
    const Window(title: 'Contacts'),
    const Window(title: 'Events'),
    const Window(title: 'Health Tips'),
    const Window(title: 'Acronyms'),
    const Window(title: 'Code Snippets'),
    const Window(title: 'Documents'),
  ];

  int get getIndex => _index;

  void updateIndex(int newIndex) {
    _index = newIndex;
    notifyListeners();
  }

  //Widget getPageAt(int index) => _pages[index];

  Widget get getPage => _pages[_index];

  static final PageProvider _inst = PageProvider._internal();

  PageProvider._internal();

  factory PageProvider() {
    return _inst;
  }
}
