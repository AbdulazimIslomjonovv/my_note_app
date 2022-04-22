import 'dart:convert';
import 'dart:io';

import '../data_base.dart';

class ChangePassword {
  static Future<void> change_password_func() async {
    await password();
  }
}

Future<void> password() async {
  stdout.write('title: ');
  String title = stdin.readLineSync() ?? '';
  Directory directory = Directory(Directory.current.path + '\\assets\\notes');
  File file = File(directory.path + '\\$title.txt');
  if (await file.exists()) {
    String result = await file.readAsString();
    DataBase database = DataBase.fromJson(jsonDecode(result));
    if (database.password != null) {
      stdout.write('old password: ');
      String? oldPassword = stdin.readLineSync();
      if (oldPassword == database.password) {
        stdout.write('new password: ');
        String? newPassword = stdin.readLineSync() ?? null;
        database.password = newPassword;
        await file.writeAsString(jsonEncode(database.toJson()));
      } else {
        throw 'eski parol xato!';
      }
    } else {
      throw 'qoyilmagan passwordni ozgartirmoqchisiz';
    }
  } else {
    throw 'asli yoq file ning passwordini ozgartirmoqchisiz!';
  }
}