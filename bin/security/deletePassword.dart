import 'dart:convert';
import 'dart:io';

import '../data_base.dart';

class DeletePassword {
  static Future<void> delete_password_func() async {
    await delete();
  }
}

Future<void> delete() async {
  stdout.write('title: ');
  String title = stdin.readLineSync() ?? '';
  Directory directory = Directory(Directory.current.path + '\\assets\\notes');
  File file = File(directory.path + '\\$title.txt');
  if (await file.exists()) {
    String result = await file.readAsString();
    DataBase dataBase = DataBase.fromJson(jsonDecode(result));
    if (dataBase.password != null) {
      dataBase.password = null;
      await file.writeAsString(jsonEncode(dataBase.toJson()));
    } else {
      throw 'qoyilmagan passwordni ochirmoqchi bolyabsiz!';
    }
  } else {
    throw 'yoq note ning passwordini ochirmoqchisiz!';
  }
}