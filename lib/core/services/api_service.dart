import 'package:dio/dio.dart';
import '../models/user_model.dart';

class ApiService {
  final Dio _dio = Dio();
  
  Future<List<UserModel>> fetchUsers() async {
    try {
      final response = await _dio.get('https://random-data-api.com/api/v2/users?size=100');
      return (response.data as List).map((e) => UserModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception("Failed to fetch users");
    }
  }
}
