import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notepro/cubits/cubit_cubit/notes_cubit.dart';
import 'package:notepro/model/note_model.dart';
import 'package:notepro/view/widgets/note_items.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({Key? key}) : super(key: key);
  // في فلاتر Widget  قواعد بناء
  //final data = const [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        // التعامل مع المودل نفسه ما كل شويه نعرف متغيرات

        List<NoteModel> notes =
            BlocProvider.of<NotesCubit>(context).notes ?? []; //مهم
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          // الملاحظات على شكل لست
          child: ListView.builder(
            itemCount: notes.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                // تصميم شكل الملاحظات
                child: NoteItems(
                  note: notes[index],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
