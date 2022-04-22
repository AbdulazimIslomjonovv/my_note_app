import 'dart:convert';
import 'dart:io';

import '../data_base.dart';

class DeleteRemainder {
  static Future<void> delete_remainder_fun() async {
    await delete();
  }
}

Future<void> delete() async {
  stdout.write('title: ');
  String title = stdin.readLineSync() ?? '';
  Directory directory = Directory(Directory.current.path + '\\assets\\notes');
  File file = File(directory.path + '\\$title.txt');
  if (await file.exists()) {
    String source = await file.readAsString();
    DataBase dataBase = DataBase.fromJson(jsonDecode(source));
    if (dataBase.remainder != null) {
      dataBase.remainder = null;
      await file.writeAsString(jsonEncode(dataBase.toJson()));
    } else {
      throw 'qoyilmagan remainder ni ochirmoqchi bolyabsiz';
    }
  } else {
    throw 'yoq note ning remainder ini ochirmoqchi bolyabsiz';
  }
}