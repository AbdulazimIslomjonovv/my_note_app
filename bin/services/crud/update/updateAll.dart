import 'dart:io';

import '../create.dart';

class UpdateAll {
  static Future<void> update_all_func() async {
    stdout.write('title: ');
    String title = stdin.readLineSync() ?? '';
    Directory directory = Directory(Directory.current.path + '\\assets\\notes');
    File file = File(directory.path + '\\$title.txt');
    if (await file.exists()) {
      String contentAll = '';
      String content = '';
      stdout.write('new note: ');
      do {
        contentAll += content + '\n';
        content = stdin.readLineSync() ?? 'save';
      } while (content.toLowerCase() != 'save');
      await Create.createFile(title: title, content: contentAll);
    } else {
      throw "yo'q file ni update qilmoqchisiz!";
    }
  }
}