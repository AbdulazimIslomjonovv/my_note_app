import 'dart:convert';
import 'dart:io';

import '../../data_base.dart';

class Split {
  static Future<void> split() async {
    await split_func();
  }
}

Future<void> split_func() async {
  stdout.write('title: ');
  String title = stdin.readLineSync() ?? '';
  Directory directory = Directory(Directory.current.path + '\\assets\\notes');
  File file = File(directory.path + '\\$title.txt');
  if (await file.exists()) {
    String source = await file.readAsString();
    DataBase dataBase = DataBase.fromJson(jsonDecode(source));
    if (dataBase.split == false) {
      dataBase.split = true;
      await file.writeAsString(jsonEncode(dataBase.toJson()));
    } else {
      throw 'split qilingan narsani qayta split qilmoqchisiz';
    }
  } else {
    throw 'yozilmagan note ni split qilmoqchisiz!';
  }
}