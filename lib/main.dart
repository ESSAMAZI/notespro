import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notepro/constans.dart';
import 'package:notepro/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notepro/model/note_model.dart';
import 'package:notepro/simple_bloc_observer.dart';
import 'package:notepro/view/nete_view.dart';

void main() async {
  //الاتصال بقاعده البيانات
  await Hive.initFlutter(); //استدعاء مكتبه hive_flutter

  Bloc.observer = SimpleBlocObserver();
  //فتح قاعده البيانات
  await Hive.openBox<NoteModel>(kNotesBox);
  //الاتصال وحفظ
  //التعامل مع المودل المحدد
  Hive.registerAdapter(NoteModelAdapter());
  runApp(const NotesAPP());
}

class NotesAPP extends StatelessWidget {
  const NotesAPP({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //لو اردنا الوصل البيانات الى كل الشاشات
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AddNoteCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          //تغير الخط كامل في التطبيق
          fontFamily: 'Poppins',
          // backgroundColor:
        ),
        home: const NoteView(),
      ),
    );
  }
}
