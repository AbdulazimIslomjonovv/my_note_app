import 'dart:convert';
import 'dart:io';

import '../../data_base.dart';
import '../crud/read/read_specific.dart';

var paths = [];

class Search {
  static Future<void> search() async {
    paths = [];
    await search1();
  }
}

Future<void> search1() async {
  stdout.write('search: ');
  String? str = stdin.readLineSync();
  if (str != null) {
    Directory directory = Directory(Directory.current.path + '\\assets\\notes');
    var list = directory.listSync();
    for (int i = 0; i < list.length; i++) {
      await generalSearch(str: str, path: list[i].path);
    }
    await readOfResult();
  }
}

Future<void> generalSearch({required String str, required String path}) async {
  File file = File(path);
  String source = await file.readAsString();
  DataBase dataBase = DataBase.fromJson(jsonDecode(source));
  String content = dataBase.content;
  String title = dataBase.title;
  await specificSearch(content: content, title: title, str: str, path: path);
}

Future<void> specificSearch({required String content, required String title, required String str, required String path}) async {
  if (content.toLowerCase().contains(str.toLowerCase()) || title.toLowerCase().contains(str.toLowerCase())) {
    paths.add(path);
  }
}

Future<void> readOfResult() async {
  for (int i = 0; i < paths.length; i++) {
    await ReadSpecific.read_specific_func(path: paths[i]);
  }
}









