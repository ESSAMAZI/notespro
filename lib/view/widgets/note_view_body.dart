import 'package:flutter/material.dart';
import 'package:notepro/view/widgets/custom_app_bar.dart';
import 'package:notepro/view/widgets/notes_list_view.dart';

class NoteViewBody extends StatelessWidget {
  const NoteViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      //
      padding: const EdgeInsets.symmetric(horizontal: 24),

      child: Column(
        children: const [
          SizedBox(height: 45),
          // الجزء الخاص بالنص الذي يحتوي ايضا على ايقونة االبحث
          //الشكل العام الخارجي
          CustomAppBar(title: 'Notes', icon: Icons.search),

          //الحزء الخاص التصميم الملاحظه
          // NoteItems(),
          //اي عمود او صف flex جيب ان توضع داخل عنصر من نوعExpanded
          Expanded(
              //Expanded تم وضع العناصر بداخل عنصر
              // لا تحتوي على مساحه طول والعرض ListView  والسبب يعود الى ان العناصر هذه في داخلة
              child: NotesListView()),
        ],
      ),
    );
  }
}
