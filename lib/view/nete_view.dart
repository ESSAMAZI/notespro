import 'package:flutter/material.dart';
import 'package:notepro/view/widgets/add_note_bottom_sheet.dart';

import 'package:notepro/view/widgets/note_view_body.dart';

class NoteView extends StatelessWidget {
  const NoteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            // backgroundColor: Colors.red,
            //لا بجد من علمها هنا وليس في التصميم الذي رح تستقبلها   shape عند عمل حواف
            //لانه ما رح يسمع لدينا هنا
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            context: context,
            builder: (context) {
              // هنا نستدعي التصميم ويفضل ان يفصل بمكان اخر
              return const AddNoteBottomSheet();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: const NoteViewBody(),
    );
  }
}
