import 'dart:convert';
import 'package:http/http.dart' as http;
import '/model/data_model.dart';

class ApiService {
  static const String url = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<DataModel>> fetchData() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => DataModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}