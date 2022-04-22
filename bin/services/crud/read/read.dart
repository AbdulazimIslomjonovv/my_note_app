import 'dart:convert';
import 'dart:io';

import '../../../data_base.dart';

class Read {
  static Future<void> read_func() async {
   await read_function();
  }
}

Future<void> read_function() async {
  stdout.write('title: ');
  String title = stdin.readLineSync()!;
  Directory directory = Directory(Directory.current.path + '\\assets\\notes');
  File file = File(directory.path + '\\$title.txt');
  if (await file.exists()) {
    String result = await file.readAsString();
    DataBase dataBase = DataBase.fromJson(jsonDecode(result));
    print(dataBase.title);
    print(dataBase.content);
    print(dataBase.time);
  } else {
    throw 'yoq file ni oqimoqchisiz!';
  }
}