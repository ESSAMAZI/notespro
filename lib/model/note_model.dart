import 'package:hive/hive.dart';

part 'note_model.g.dart'; //لابد ان يكون نفس اسم المودل تماما

//تحديد العناوين
@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String subTitle;
  @HiveField(2)
  final String date;
  @HiveField(3)
  int color;

  NoteModel(
      {required this.title,
      required this.subTitle,
      required this.date,
      required this.color});
}

//تشغيل الكود
//app flutter packages pub run build_runner build
