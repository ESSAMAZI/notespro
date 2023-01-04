import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notepro/constans.dart';
import 'package:notepro/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notepro/cubits/add_note_cubit/add_note_state.dart';
import 'package:notepro/cubits/cubit_cubit/notes_cubit.dart';

import 'add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailure) {}
          if (state is AddNoteSuccess) {
            //تحديث قائمة
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            // اغلاق الشاشة
            Navigator.pop(context);
            ShowToast(text: 'Add Note Success', states: ToastStates.SUCCESS);
          }
        },
        builder: (context, state) {
          // يجب ان ياتي بعده ModalProgressHUD لا ياتي قبل العنصر SingleChildScrollView

          return AbsorbPointer(
            //يمنع استخدام اي شي على الشاشة
            absorbing: state is AddNoteLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                  right: 16,
                  left: 16,
                  //تجلب لنا مساحه بارتفاع الكيبورد
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const SingleChildScrollView(child: AddNoteForm()),
            ),
          );
        },
      ),
    );
  }
}
