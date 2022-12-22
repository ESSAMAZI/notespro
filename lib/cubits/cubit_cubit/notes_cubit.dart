// ignore: depend_on_referenced_packages
// ignore_for_file: depend_on_referenced_packages, duplicate_ignore

import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:notepro/constans.dart';
import 'package:notepro/model/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  fetchAllNotes() async {
    emit(NotesLoading());

    try {
      //نستدعي البوكس الذي رح نخزن فيها
      //var noteBox = Hive.box(kNotesBox);
      var noteBox = Hive.box<NoteModel>(kNotesBox);
      //جلب كل البيانات  المذكره
      List<NoteModel> notes = noteBox.values.toList();
      // noteBox.values.toList();
      emit(NotesSuccess(notes));
    } catch (e) {
      emit(NotesFailur(e.toString()));
    }
  }
}
