import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notepro/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notepro/cubits/add_note_cubit/add_note_state.dart';

import 'add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailure) {}
          if (state is AddNoteSuccess) {
            // اغلاق الشاشة
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          // يجب ان ياتي بعده ModalProgressHUD لا ياتي قبل العنصر SingleChildScrollView
          return ModalProgressHUD(
              //في حاله الانتظار يظهر لنا دائره التحميل
              inAsyncCall: state is AddNoteLoading ? true : false,
              child: const SingleChildScrollView(child: AddNoteForm()));
        },
      ),
    );
  }
}
