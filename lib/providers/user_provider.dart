import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/models/user_model.dart';
import '../core/services/api_service.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());
final selectedIndexProvider = StateProvider<int>((ref) => 0);

final userNotifierProvider = StateNotifierProvider<UserNotifier, AsyncValue<List<UserModel>>>((ref) {
  return UserNotifier(ref.watch(apiServiceProvider));
});



class UserNotifier extends StateNotifier<AsyncValue<List<UserModel>>> {
  final ApiService _apiService;
  
  UserNotifier(this._apiService) : super(const AsyncValue.loading()) {
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      final users = await _apiService.fetchUsers();
      state = AsyncValue.data(users);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

