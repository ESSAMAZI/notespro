import 'package:flutter/material.dart';

import 'package:notepro/constans.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key, required this.hint, this.maxLine = 1, this.onSaved})
      : super(key: key);
  final String hint;
  final int maxLine;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      //null التحقق من البيانات انها ليست فارغة او ب
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        } else {
          return null;
        }
      },
      cursorColor: KPrimaryColor, //مؤشر النص
      maxLines: maxLine,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: KPrimaryColor),
          border: buildBorder(), //
          enabledBorder: buildBorder(), //لون الشكل الخارجي له قبل الضفط عليه
          //لون الشكل الخارجي له عند الضفط عليه
          focusedBorder: buildBorder(KPrimaryColor)),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: color ?? Colors.white));
  }
}
