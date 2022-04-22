import 'dart:convert';
import 'dart:io';

import '../../../data_base.dart';

class UpdateSet {
  static Future<void> update_set_func() async {}
}

Future<void> update_set() async {
  stdout.write('update set: ');
  String? str = stdin.readLineSync() ?? null;
  if (str != null) {

  }
}

Future<void> whichHasStr({required String str}) async {
  Directory directory = Directory(Directory.current.path + '\\assets\\notes');
  List<FileSystemEntity> list = directory.listSync();
  for (int i = 0; i < list.length; i++) {
    File file = File(list[i].path);
    String source = await file.readAsString();
    DataBase dataBase = DataBase.fromJson(jsonDecode(source));
    if (dataBase.content.toLowerCase().contains(str.toLowerCase()) ||
        dataBase.title.toLowerCase().contains(str.toLowerCase())) {
      await changeForUser(path: list[i].path, str:  str);
    }
  }
}

Future<void> changeForUser({required String path, required String str}) async {
  File file = File(path);
  String source = await file.readAsString();
  DataBase dataBase = DataBase.fromJson(jsonDecode(source));
  String indexOfContent = '';
  String content = '';
  String title;
  int indexFirst = 0;
  int indexLast = 0;
  if (dataBase.content.toLowerCase().contains(str.toLowerCase())) {
    while (indexLast < dataBase.content.length) {
      indexFirst = indexLast;
      indexLast = dataBase.content.toLowerCase().indexOf(str.toLowerCase());
    }
  } else if (dataBase.title.toLowerCase().contains(str.toLowerCase()));
}