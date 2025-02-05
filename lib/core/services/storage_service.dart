import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/user_model.dart';

class StorageService {
  static const String _key = "favorites";
  static final StorageService _instance = StorageService._internal();
  SharedPreferences? _prefs;

  factory StorageService() => _instance;
  StorageService._internal();

  Future<void> _initPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  Future<List<UserModel>> loadFavorites() async {
    try {
      await _initPrefs();
      final jsonString = _prefs?.getString(_key);
      if (jsonString == null || jsonString.isEmpty) return [];

      final List<dynamic> decodedList = json.decode(jsonString);
      return decodedList.map((e) => UserModel.fromJson(e)).toList();
    } catch (e) {
      return []; 
    }
  }

  Future<void> saveFavorites(List<UserModel> favorites) async {
    try {
      await _initPrefs();
      final jsonString = json.encode(favorites.map((e) => e.toJson()).toList());
      await _prefs?.setString(_key, jsonString);
    } catch (e) {
      throw Exception("Failed to save favorites");
    }
  }
}
