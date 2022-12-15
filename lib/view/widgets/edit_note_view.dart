import 'package:flutter/material.dart';
import 'package:notepro/view/widgets/edit_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //التعديل رح ننتقل الى التعديل
      body: EditNoteViewBody(),
    );
  }
}
