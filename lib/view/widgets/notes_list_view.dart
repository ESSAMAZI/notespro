import 'package:flutter/cupertino.dart';
import 'package:notepro/view/widgets/custom_note_items.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({Key? key}) : super(key: key);
  // في فلاتر Widget  قواعد بناء
  //final data = const [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: NoteItems(),
          );
        },
      ),
    );
  }
}
