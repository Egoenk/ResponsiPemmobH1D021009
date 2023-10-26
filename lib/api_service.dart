import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> fetchData(int id) async {
  final response = await http.get(Uri.parse('https://responsi1a.dalhaqq.xyz/ikan/$id'));

  if (response.statusCode == 200) {
    String data = response.body;
    return data;
  } else {
    print('Failed to fetch data. Status code: ${response.statusCode}');
    return '';
  }
}


Future<bool> updateIkan(int id, String name, String habitat, String color, String jenis) async {
  final url = Uri.parse('https://responsi1a.dalhaqq.xyz/ikan/$id');

  final response = await http.put(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, dynamic>{
      'nama': name,
      'jenis': jenis,
      'habitat': habitat,
      'warna': color,
    }),
  );

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}