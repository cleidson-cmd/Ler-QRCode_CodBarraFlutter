import 'package:flutter/services.dart';

class ClipBoardHelper {
  ClipBoardHelper._();

  static Future<void> copy(String value) async {
    await Clipboard.setData(ClipboardData(text: value));
  }

  static Future<String> paste() async {
    final clipBoardData = await Clipboard.getData(Clipboard.kTextPlain);
    return clipBoardData?.text ?? '';
  }

  static Future<bool> hasData() async {
    return Clipboard.hasStrings();
  }
}
