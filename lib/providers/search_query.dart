import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/models/user_model.dart';
import 'package:flutter_application_1/providers/user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchProvider = StateProvider<String>((ref) => '');
final sortOptionProvider = StateProvider<int>((ref) => 0);
final textControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());
final filteredUsersProvider = Provider<List<UserModel>>((ref) {
  final users = ref.watch(userNotifierProvider).asData?.value ?? [];
  final searchQuery = ref.watch(searchProvider).toLowerCase().trim();
  final sortOption = ref.watch(sortOptionProvider);

  if (users.isEmpty) return [];

  List<UserModel> filteredUsers = users.where((user) {
    return user.first_name.toLowerCase().contains(searchQuery) ||
           user.last_name.toLowerCase().contains(searchQuery) ||
           user.email.toLowerCase().contains(searchQuery) ||
           user.date_of_birth.toString().contains(searchQuery);
  }).toList();

  if (searchQuery.isNotEmpty) {
  if (filteredUsers.any((user) => user.first_name.toLowerCase().contains(searchQuery))) {
      filteredUsers.sort((a, b) => a.first_name.compareTo(b.first_name));
    } else if (filteredUsers.any((user) => user.last_name.toLowerCase().contains(searchQuery))) {
      filteredUsers.sort((a, b) => a.last_name.compareTo(b.last_name));
    } else if (filteredUsers.any((user) => user.email.toLowerCase().contains(searchQuery))) {
      filteredUsers.sort((a, b) => a.email.compareTo(b.email));
    } else if (filteredUsers.any((user) => user.date_of_birth.toString().contains(searchQuery))) {
      filteredUsers.sort((a, b) => a.date_of_birth.compareTo(b.date_of_birth));
    }
  } else {
  if (searchQuery.isEmpty) {
    switch (sortOption) {
      case 0: 
        // No sort
        break;
      case 2: 
        
        filteredUsers.sort((a, b) => a.date_of_birth.compareTo(b.date_of_birth));
        break;
      case 1: 
      
        filteredUsers.sort((a, b) => b.date_of_birth.compareTo(a.date_of_birth));
        break;
    }
  }

  }

  return filteredUsers;
});

