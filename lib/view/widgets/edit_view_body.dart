import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notepro/cubits/cubit_cubit/notes_cubit.dart';
import 'package:notepro/model/note_model.dart';
import 'package:notepro/view/widgets/custom_app_bar.dart';
import 'package:notepro/view/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({Key? key, required this.note}) : super(key: key);
  //اثناء التعديل نخليه يستقبل المودل
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 50),
          CustomAppBar(
            title: 'Edit Note',
            icon: Icons.check,
            onPressed: () {
              //التعديل
              //النص كان بنل خذ النص القديم
              widget.note.title = title ?? widget.note.title;
              widget.note.subTitle = content ?? widget.note.subTitle;
              // if (title != null) {
              //   widget.note.title = title!;
              // }
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 50),
          CustomTextField(
            hint: widget.note.title,
            onChanged: (value) {
              title = value;
            },
          ),
          const SizedBox(height: 14),
          CustomTextField(
            hint: widget.note.subTitle,
            maxLine: 5,
            onChanged: (value) {
              content = value;
            },
          ),
        ],
      ),
    );
  }
}
