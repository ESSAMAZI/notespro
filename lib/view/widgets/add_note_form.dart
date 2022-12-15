import 'package:flutter/material.dart';

import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    Key? key,
  }) : super(key: key);

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formky = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? tilte, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formky,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(height: 35),
          CustomTextField(
            hint: 'Title',
            onSaved: (value) {
              tilte = value;
            },
          ),
          const SizedBox(height: 12),
          CustomTextField(
            hint: 'Content',
            maxLine: 5,
            onSaved: (value) {
              subTitle = value;
            },
          ),
          const SizedBox(height: 32),
          CustomButton(
            onTap: () {
              if (formky.currentState!.validate()) {
                formky.currentState!.save();
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
          const SizedBox(height: 15)
        ],
      ),
    );
  }
}
