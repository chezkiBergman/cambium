import 'package:flutter_application_1/core/models/user_model.dart';
import 'package:flutter_application_1/core/services/storage_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteProvider = StateNotifierProvider<FavoriteNotifier, AsyncValue<List<UserModel>>>((ref) {
  return FavoriteNotifier();
});

class FavoriteNotifier extends StateNotifier<AsyncValue<List<UserModel>>> {
  FavoriteNotifier() : super(const AsyncValue.loading()) {
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    try {
      final favorites = await StorageService().loadFavorites();
      state = AsyncValue.data(favorites);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> addFavorite(UserModel user) async {
    if (state is AsyncData) {
      final favorites = [...state.value!, user];
      state = AsyncValue.data(favorites);
      await StorageService().saveFavorites(favorites);
    }
  }

  Future<void> removeFavorite(int id) async {
    if (state is AsyncData) {
      final favorites = state.value!.where((user) => user.id != id).toList();
      state = AsyncValue.data(favorites);
      await StorageService().saveFavorites(favorites);
    }
  }
}
