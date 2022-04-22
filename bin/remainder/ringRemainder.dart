import 'dart:convert';
import 'dart:io';

import '../data_base.dart';
import '../services/crud/read/read_specific.dart';

var list = [];
class RingRemainder {
  static Future<void> ring_remainder_func() async {
    await knowAll();
  }
}

Future<void> knowAll() async {
  Directory directory = Directory(Directory.current.path + '\\assets\\notes');
  list = directory.listSync();
  await whichHasRemainder();
}

Future<void> whichHasRemainder() async {
  var newList = [];
  for (int i = 0; i < list.length; i++)  {
    File file = File(list[i].path);
    String result = await file.readAsString();
    DataBase database = DataBase.fromJson(jsonDecode(result));
    if (database.remainder != null) {
      newList.add(list[i]);
    }
  }
  list = newList;
  await ring();
}

Future<void> ring() async {
  for (int i = 0; i < list.length; i++) {
    File file = File(list[i].path);
    String result = await file.readAsString();
    DataBase dataBase = DataBase.fromJson(jsonDecode(result));
    List<String> clock = List.from(dataBase.remainder!.split(':'));
    int month = int.parse(clock[0]);
    int day = int.parse(clock[1]);
    int hour = int.parse(clock[2]);
    int minute = int.parse(clock[3]);
    DateTime dateTime = DateTime(DateTime.now().year, month, day, hour, minute, DateTime.now().second);
    if ((dateTime.difference(DateTime.now()).isNegative)) {
      await ringing(path: list[i].path);
    }
  }
}

Future<void> ringing({required String path}) async {
  File file = File(path);
  String source = await file.readAsString();
  DataBase dataBase = DataBase.fromJson(jsonDecode(source));
  print('remainder of ${dataBase.title}, do you want to open it y\\n');
  bool bl = (stdin.readLineSync() == 'y') ? true: false;
  if (bl) {
    await ReadSpecific.read_specific_func(path: path);
  }
  dataBase.remainder = null;
  await file.writeAsString(jsonEncode(dataBase.toJson()));
}