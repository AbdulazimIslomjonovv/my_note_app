import 'dart:convert';
import 'dart:io';

import '../../../data_base.dart';

class UpdateTitle {
  static Future<void> update_title_func() async {
    await update();
  }
}

Future<void> update() async {
  Directory directory = Directory(Directory.current.path + '\\assets\\notes');
  stdout.write('title: ');
  String title = stdin.readLineSync() ?? '';
  File file = File(directory.path + '\\$title.txt');
  if (await file.exists()) {
    stdout.write('new title: ');
    String newTitle = stdin.readLineSync() ?? '';
    File file2 = File(directory.path + '\\$newTitle.txt');
    if (!await file2.exists()) {
      String result = await file.readAsString();
      DataBase dataBase = DataBase.fromJson(jsonDecode(result));
      dataBase.title = newTitle;
      await file.delete();
      File file3 = File(directory.path  + '\\$newTitle.txt');
      await file3.writeAsString(jsonEncode(dataBase.toJson()));
    } else {
      throw 'avvaldan bor bolgan file namini newTitle sifatida ishlatmoqchisiz!';
    }
  } else {
    throw 'yoq file title sini update qilmoqchisiz!';
  }
}