import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notepro/cubits/cubit_cubit/notes_cubit.dart';
import 'package:notepro/view/widgets/add_note_bottom_sheet.dart';

import 'package:notepro/view/widgets/note_view_body.dart';

class NoteView extends StatelessWidget {
  const NoteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              // تسمح لنا ان التصميم يطلع الى فوق عند استخدام الكبيودر
              //بدون ما يغطي على الشاشه
              isScrollControlled: true,
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
        //جسم التصميم 1
        body: const NoteViewBody(),
      ),
    );
  }
}
