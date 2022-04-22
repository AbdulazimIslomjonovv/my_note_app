import 'dart:convert';
import 'dart:io';

import '../data_base.dart';

class AddRemainder {
  static Future<void> add_remainder_func() async {
    await remainder();
  }
}

Future<void> remainder() async {
  stdout.write('title: ');
  String title = stdin.readLineSync() ?? '';
  Directory directory = Directory(Directory.current.path + '\\assets\\notes');
  File file = File(directory.path + '\\$title.txt');
  if (await file.exists()) {
    String result = await file.readAsString();
    DataBase dataBase = DataBase.fromJson(jsonDecode(result));
    if (dataBase.remainder == null) {
      stdout.write('remainder(month:day:hour:minute): ');
      String strRemainder = stdin.readLineSync() ?? '';
      List<String> list = strRemainder.split(':');
      dataBase.remainder = strRemainder;
      await file.writeAsString(jsonEncode(dataBase.toJson()));
    } else {
      throw 'sizda remainder qoyib bolingan!';
    }
  } else {
    throw 'yoq note ga remainder qoymoqchisiz!';
  }
}
