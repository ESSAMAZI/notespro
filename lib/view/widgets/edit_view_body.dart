import 'package:flutter/material.dart';
import 'package:notepro/view/widgets/custom_app_bar.dart';
import 'package:notepro/view/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: const [
          SizedBox(height: 50),
          CustomAppBar(
            title: 'Edit Note',
            icon: Icons.check,
          ),
          SizedBox(height: 50),
          CustomTextField(hint: 'Title'),
          SizedBox(height: 14),
          CustomTextField(hint: 'Content', maxLine: 5),
        ],
      ),
    );
  }
}
