import '../remainder/addRemainder.dart';
import '../remainder/deleteRemainder.dart';
import '../remainder/updateRemainder.dart';
import '../security/addPassword.dart';
import '../security/change_password.dart';
import '../security/deletePassword.dart';
import 'crud/create.dart';
import 'crud/delete.dart';
import 'crud/read/read.dart';
import 'crud/read/readAll.dart';
import 'crud/update/updateAll.dart';
import 'crud/update/updateTitle.dart';
import 'search/search.dart';
import 'split/split.dart';
import 'split/unsplit.dart';

class ReadTxt {
  static Future<void> read_txt_func({required String string}) async {
    if (string == 'create') {
      await Create.create_func();
    } else if (string == 'delete') {
      await Delete.delete_func();
    } else if (string == 'read') {
      await Read.read_func();
    } else if (string == 'readAll') {
      await ReadALl.readAll();
    } else if (string == 'split') {
      await Split.split();
    } else if (string == 'unsplit') {
      await UnSplit.un_split_func();
    } else if (string == 'updateAll') {
      await UpdateAll.update_all_func();
    } else if (string == 'addPassword') {
      await AddPassword.add_password_func();
    } else if (string == 'changePassword') {
      await ChangePassword.change_password_func();
    } else if (string == 'updateTitle') {
      await UpdateTitle.update_title_func();
    } else if (string == 'updateSet') {
      //todo
    } else if (string == 'search') {
      await Search.search();
    } else if (string == 'deletePassword') {
      await DeletePassword.delete_password_func();
    } else if (string == 'help') {
      //todo
    } else if (string == 'addRemainder'){
      await AddRemainder.add_remainder_func();
    } else if (string == 'updateRemainder'){
      await UpdateRemainder.update_remainder_fun();
    } else if (string == 'deleteRemainder'){
      await DeleteRemainder.delete_remainder_fun();
    } else {
      throw 'notogri buyruq, help command i orqali barcha buyruqlarni korishingiz mumkin';
    }
  }
}