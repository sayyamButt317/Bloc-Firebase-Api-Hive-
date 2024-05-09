import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:msb_task3/Network/model/user_model.dart';

class ApiRepository {
  final String baseUrl;

  ApiRepository({required this.baseUrl});

  Future<List<ApiModel>> getUserData() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/users'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> userList = data['data'];

        return userList.map((e) {
          return ApiModel(
            firstName: e['first_name'] as String,
            avatar: e['avatar'] as String,
          );
        }).toList();
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
