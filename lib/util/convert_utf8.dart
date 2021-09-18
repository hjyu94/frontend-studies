import 'dart:convert';

dynamic convertUtf8ToObject(dynamic body) {
  String responseBody = jsonEncode(body); // to json data
  dynamic convertBody = jsonDecode(utf8.decode(responseBody.codeUnits));
  return convertBody;
}