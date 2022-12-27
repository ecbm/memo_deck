import 'package:flutter/material.dart';
import 'package:memo_deck/ui_widgets/buttons.dart';
import 'package:memo_deck/ui_widgets/containers.dart';

class NotesApp extends StatefulWidget {
  const NotesApp({super.key});

  @override
  State<NotesApp> createState() => _NotesAppState();
}

class _NotesAppState extends State<NotesApp> {
  @override
  Widget build(BuildContext context) {
    return Window(
        title: 'Notes',
        child: EmbossedButton(
          height: 25,
          width: 80,
          child: const Text('New Note'),
          ontap: () {
            showDialog(
                context: context,
                builder: (context) => const NewNote(),
                barrierColor: null);
          },
        ));
  }
}

// this is gonna be menu to pick when you're looking for notes from
// TODO: IMPLEMENT DATEPICKER
class DatePickerDropdown extends StatefulWidget {
  const DatePickerDropdown({super.key});

  @override
  State<DatePickerDropdown> createState() => _DatePickerDropdownState();
}

class _DatePickerDropdownState extends State<DatePickerDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// this is gonna be the embossed note button that you can click on in the list to see the full note
// TODO: IMPLEMENT NOTESCARD
class NoteCard extends StatefulWidget {
  const NoteCard({super.key});

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// this is gonna be a dropdown to let you select note category. i.e. serious, personal, funny, knowledge, health
// TODO: IMPLEMENT CATEGORIES
class CategoryPicker extends StatefulWidget {
  const CategoryPicker({super.key});

  @override
  State<CategoryPicker> createState() => _CategoryPickerState();
}

class _CategoryPickerState extends State<CategoryPicker> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class NewNote extends StatelessWidget {
  const NewNote({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: SizedBox(
        width: 500,
        child: Window(
          title: "Enter Note",
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Text('Title'),
                  SizedBox(
                    height: 25,
                    width: 400,
                    child: EmbossedContainer(
                      invert: true,
                      color: Colors.white,
                      child: Container(),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
