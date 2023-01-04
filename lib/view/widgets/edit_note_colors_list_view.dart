import 'package:flutter/cupertino.dart';
import 'package:notepro/constans.dart';
import 'package:notepro/model/note_model.dart';
import 'package:notepro/view/widgets/color_list_view.dart';

class EditNoteColorsList extends StatefulWidget {
  const EditNoteColorsList({Key? key, required this.note}) : super(key: key);
  final NoteModel note;
  @override
  State<EditNoteColorsList> createState() => _EditNoteColorsListState();
}

class _EditNoteColorsListState extends State<EditNoteColorsList> {
  late int currentIndex;
  @override
  void initState() {
    //جلب قيم  اللون المحدد ملاحظه التي نريد ان نعدل عليها
    currentIndex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 37 * 2,
      child: ListView.builder(
        itemCount: kColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = index;
                  //التعديل
                  widget.note.color = kColors[index].value;
                  //ارسال اللون
                  // BlocProvider.of<AddNoteCubit>(context).color = kColors[index];
                });
              },
              child: ColorItme(
                  color: kColors[index], isActive: currentIndex == index)),
        ),
      ),
    );
  }
}
