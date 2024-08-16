class Regex {
  static RegExp phone = RegExp(r'^(?:[+0]9)?[0-9]{10,11}$');
  static RegExp number = RegExp(r'^[0-9]+$');
  static RegExp email = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static RegExp getValueFromContent = RegExp(r'"content"\s*:\s*"((?:\\"|[^"])*)"');
  static RegExp getValueFromIsClear = RegExp(r'"isClear"\s*:\s*(false|true)');
}
