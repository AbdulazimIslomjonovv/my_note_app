import 'dart:convert';
import 'dart:io';

import '../data_base.dart';

class AddPassword {
  static Future<void> add_password_func() async {
      await password();
  }
}

Future<void> password() async {
  stdout.write('title: ');
  String title = stdin.readLineSync() ?? '';
  Directory directory = Directory(Directory.current.path + '\\assets\\notes');
  File file = File(directory.path + '\\$title.txt');
  if (await file.exists()) {
    String result = await file.readAsString();
    DataBase database = DataBase.fromJson(jsonDecode(result));
    if (database.password == null) {
      stdout.write('password: ');
      String? password = stdin.readLineSync() ?? null;
      database.password = password;
      await file.writeAsString(jsonEncode(database.toJson()));
    } else {
      throw 'password avvaldan qoyib bolingan!';
    }
  } else {
    throw "yo'q note ga password qoymoqchisiz";
  }
}