List<String> extractPartsFromCommaSeparatedString(String input) {
  if (input.isEmpty) {
    return ['', ''];
  }

  List<String> parts = input.split(',');
  if (parts.length >= 2) {
    return [parts[0], parts[1]];
  } else {
    return [parts[0], ''];
  }
}

String capitalize(String s) {
  return s.substring(0, 1).toUpperCase() + s.substring(1);
}

String formatTimeFromUniqTime(DateTime dateTime) {
  return '${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
}

String formatDateFromUniqTime(DateTime dateTime) {
  return '${dateTime.day}/${dateTime.month}';
}

String formatCountDownTimeHourFromUniqTime(DateTime dateTime) {
  return '${dateTime.hour}';
}

String formatCountDownTimeMinuteFromUniqTime(DateTime dateTime) {
  return dateTime.minute.toString().padLeft(2, '0');
}

String formatCountDownTimeSecondFromUniqTime(DateTime dateTime) {
  return dateTime.second.toString().padLeft(2, '0');
}

String removeConsecutiveNewlines(String? text) {
  return text!.replaceAll(RegExp(r'\n+'), ' ');
}
