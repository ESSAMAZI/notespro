import 'package:flutter/material.dart';
import 'package:notepro/model/note_model.dart';
import 'package:notepro/view/widgets/edit_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({Key? key, required this.note}) : super(key: key);

  //اثناء التعديل نخليه يستقبل المودل
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //التعديل رح ننتقل الى التعديل
      body: EditNoteViewBody(note: note),
    );
  }
}
