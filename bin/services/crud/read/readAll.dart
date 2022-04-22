import 'dart:convert';
import 'dart:io';

import '../../../data_base.dart';
import 'read_specific.dart';


int t = 0;

class ReadALl {
  static Future<void> readAll() async {
    t = 0;
    await read_all();
  }
}

Future<void> read_all() async {
  Directory directory = Directory(Directory.current.path + '\\assets\\notes');
  List<FileSystemEntity> newList = directory.listSync();
  List<FileSystemEntity> list = await fillList(list: newList);

  for (int i = 0; i < list.length; i++) {
    await read_all_specific(path: list[i].path);
  }
  stdout.write('=> ');
  String s = stdin.readLineSync() ?? 'xato!';
  if (int.tryParse(s) is int && int.parse(s) <= list.length && int.parse(s) >= 0) {
    await ReadSpecific.read_specific_func(path: list[int.parse(s) - 1].path);
  }
}

Future<void> read_all_specific({required String path}) async {
  t++;
  print('---------$t---------');
  File file = File(path);
  String source = await file.readAsString();
  DataBase dataBase = DataBase.fromJson(jsonDecode(source));
  String b = dataBase.split == true ? '/': '';
  print(dataBase.title + '\t\t\t' + '$b');
}

Future<List<FileSystemEntity>> fillList({required List<FileSystemEntity> list}) async {
  List<FileSystemEntity> first = [];
  List<FileSystemEntity> last = [];
  for (int i = 0; i < list.length; i++) {
    File file = File(list[i].path);
    String source = await file.readAsString();
    DataBase dataBase = DataBase.fromJson(jsonDecode(source));
    if (dataBase.split == true) {
      first.add(list[i]);
    } else {
      last.add(list[i]);
    }
  }
  List<FileSystemEntity> listAll = [...first, ...last];
  return listAll;
}