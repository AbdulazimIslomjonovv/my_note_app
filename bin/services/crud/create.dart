import 'dart:convert';
import 'dart:io';

import '../../data_base.dart';

class Create {
  static Future<void> create_func() async {
    await Create.filesIsCreated();
    await titleAndContent();
  }

  static Future<void> createFile({required String title, required String content}) async {
    Directory directory = Directory(Directory.current.path + '\\assets\\notes');
    File file = File(directory.path + '\\$title.txt');
    DataBase dataBase = DataBase(title: title, content: content, time: DateTime.now().toString());
    await file.writeAsString(jsonEncode(dataBase.toJson()));
  }

  static Future<void> filesIsCreated() async {
    Directory directory2 = Directory(Directory.current.path + '\\assets');
    if (!await directory2.exists()) await directory2.create();
    Directory directory = Directory(Directory.current.path + '\\assets\\notes');
    if (!await directory.exists()) await directory.create();
  }
}

Future<void> titleAndContent([String? a]) async {
  stdout.write('title: ');
  String title = stdin.readLineSync() ?? '';
  Directory directory = Directory(Directory.current.path + '\\assets\\notes');
  File file = File(directory.path + '\\$title.txt');
  if (await file.exists()) {
    throw 'bir nom bilan 2 ta file yaratmoqchisiz!';
  }
  String contentAll = '';
  String content = '';
  stdout.write('note: ');
  do {
    contentAll += content + '\n';
    content = stdin.readLineSync() ?? 'save';
  } while (content.toLowerCase() != 'save');
  await Create.createFile(title: title, content: contentAll);
}

