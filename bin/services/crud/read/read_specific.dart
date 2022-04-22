import 'dart:convert';
import 'dart:io';

import '../../../data_base.dart';

class ReadSpecific {
  static Future<void> read_specific_func({required String path}) async {
    File file = File(path);
    String source = await file.readAsString();
    DataBase dataBase = DataBase.fromJson(jsonDecode(source));
    print(dataBase.title);
    print(dataBase.content);
    print(dataBase.time);
    print(dataBase.remainder);
    print('----------------');
  }
}

