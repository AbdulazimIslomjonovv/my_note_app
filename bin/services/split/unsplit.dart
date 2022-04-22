import 'dart:convert';
import 'dart:io';

import '../../data_base.dart';

class UnSplit {
  static Future<void> un_split_func() async {
    await un_split();
  }
}

Future<void> un_split() async {
  stdout.write('title: ');
  String title = stdin.readLineSync() ?? '';
  Directory directory = Directory(Directory.current.path + '\\assets\\notes');
  File file = File(directory.path + '\\$title.txt');
  if (await file.exists()) {
    String source = await file.readAsString();
    DataBase dataBase = DataBase.fromJson(jsonDecode(source));
    if (dataBase.split == true) {
      dataBase.split = false;
      await file.writeAsString(jsonEncode(dataBase.toJson()));
    } else {
      throw 'split qilinmagan narsani unsplit qilmoqchisiz';
    }
  } else {
    throw 'yozilmagan note ni unsplit qilmoqchisiz!';
  }
}