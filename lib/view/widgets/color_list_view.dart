import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notepro/cubits/add_note_cubit/add_note_cubit.dart';

class ColorItme extends StatelessWidget {
  const ColorItme({Key? key, required this.isActive, required this.color})
      : super(key: key);

  final bool isActive; // من اجل نعمل اشارة لون الذي تم اختياره

  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 37,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 35,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 37,
            backgroundColor: color,
          );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({Key? key}) : super(key: key);

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0; // عنوان اللون المحدد
  //color palette generator
  List<Color> colors = const [
    Color(0xff19535f),
    Color(0xff0b7a75),
    Color(0xffD7C9AA),
    Color(0xff7B2D26),
    Color(0xffF0F3F5),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 37 * 2,
      child: ListView.builder(
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = index;
                  //ارسال اللون
                  BlocProvider.of<AddNoteCubit>(context).color = colors[index];
                });
              },
              child: ColorItme(
                  color: colors[index], isActive: currentIndex == index)),
        ),
      ),
    );
  }
}
