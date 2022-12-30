import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notepro/constans.dart';
import 'package:notepro/cubits/add_note_cubit/add_note_state.dart';
import 'package:notepro/model/note_model.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(NotesInitial());

  // تخزين اللون
  Color color = const Color(0xff19535f);

  addNote(NoteModel note) async {
    note.color = color.value;
    emit(AddNoteLoading());

    try {
      //نستدعي البوكس الذي رح نخزن فيها
      //var noteBox = Hive.box(kNotesBox);
      var noteBox = Hive.box<NoteModel>(kNotesBox);
      await noteBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }

  //add<T>(T name) {}
  //الاستدعاء
  //add<String>('66');
  // add<int>(66);
  //add<String>('')//عند استدعاء الداله نحدد النوع
  //add<T>(T name) {داله تستقبل اي نوع من المتفيرات }
}
