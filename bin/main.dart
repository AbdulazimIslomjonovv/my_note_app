import 'dart:io';

import 'remainder/ringRemainder.dart';
import 'services/crud/create.dart';
import 'services/read_txt.dart';

void main() async {
  String str = '';
  await Create.filesIsCreated();
  do {
    await RingRemainder.ring_remainder_func();
    try {
      stdout.write('menu: ');
      str = stdin.readLineSync()!;
      await ReadTxt.read_txt_func(string: str);
    } catch (e) {
      print(e);
    }
  } while (str.toLowerCase != 'finish');
}