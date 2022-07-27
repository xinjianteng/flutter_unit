import 'dart:io';
import 'dart:convert';

Future<void> main() async {

  var config =File('test/class_name.dart');
  try {
    var contents = await config.readAsString();
    print(contents);
  } catch (e) {
    print(e);
  }
}