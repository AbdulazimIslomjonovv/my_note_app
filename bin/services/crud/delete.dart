import 'dart:io';

class Delete {
  static Future<void> delete_func() async {
   await delete();
  }
}

Future<void> delete() async {
  stdout.write('title: ');
  String title = stdin.readLineSync() ?? '';
  Directory directory = Directory(Directory.current.path + '\\assets\\notes');
  File file = File(directory.path + '\\$title.txt');
  if (await file.exists()) {
    file.delete();
  } else {
    throw "yo'q file ni ochiqmoqchisiz!";
  }
}