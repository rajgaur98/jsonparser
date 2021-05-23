import 'dart:convert';

import 'package:http/http.dart';

class Services {
  Future fetch() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/todos/');
    final response = await get(url);
    final data = await json.decode(response.body);
    return data;
  }
}
