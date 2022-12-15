import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    // ignore: todo
    // TODO: implement onChange
    //معرفه حالة كل بلوك اين وصلنا
    debugPrint('change=$change');
  }

  @override
  void onClose(BlocBase bloc) {
    // ignore: todo
    // TODO: implement onClose
  }

  @override
  void onCreate(BlocBase bloc) {
    // ignore: todo
    // TODO: implement onCreate
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // ignore: todo
    // TODO: implement onError
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // ignore: todo
    // TODO: implement onEvent
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // ignore: todo
    // TODO: implement onTransition
  }
}
