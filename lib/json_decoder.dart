import 'dart:convert';

String formatJson(dynamic json) {
  return JsonEncoder.withIndent('  ').convert(json);
}

Map<String, dynamic> decodeJson(String jsonString) {
  return json.decode(jsonString);
}
