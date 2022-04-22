import 'dart:convert';
import 'dart:io';

import '../data_base.dart';

class UpdateRemainder {
  static Future<void> update_remainder_fun() async {
    await update();
  }
}

Future<void> update() async {
  stdout.write('title: ');
  String title = stdin.readLineSync() ?? '';
  Directory directory = Directory(Directory.current.path + '\\assets\\notes');
  File file = File(directory.path + '\\$title.txt');
  if (await file.exists()) {
    String source = await file.readAsString();
    DataBase dataBase = DataBase.fromJson(jsonDecode(source));
    if (dataBase.remainder != null) {
      stdout.write('new remainder(month:day:hour:minute): ');
      String strRemainder = stdin.readLineSync() ?? '';
      dataBase.remainder = strRemainder;
      await file.writeAsString(jsonEncode(dataBase.toJson()));
    } else {
      throw 'qoyilmagan remainder ni update qilmoqchisiz!';
    }
  } else {
    throw 'yoq note ning remainder ini update qilmoqchisiz!';
  }
}