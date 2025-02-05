import 'package:flutter/material.dart';
import 'package:flutter_application_1/generated/l10n.dart';
import 'package:flutter_application_1/providers/favorite_provider.dart';
import 'package:flutter_application_1/widgets/user_item_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteState = ref.watch(favoriteProvider);

    return favoriteState.when(
      data: (favorites) => RefreshIndicator(
        onRefresh: () async => ref.invalidate(favoriteProvider),
        child: favorites.isEmpty
            ?  Center(child: Text(S.current.no_favorites))
            : ListView.separated(separatorBuilder: (context, index) => const SizedBox(height: 10),
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  final user = favorites[index];

                  return ItemCardWidget(
                    user: user,
                    onFavoriteToggle: () => 
                        ref.read(favoriteProvider.notifier).removeFavorite(user.id),
                    isFavorite: true, 
                  );
                },
              ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text('${S.current.error_loading_favorites} $err')),
    );
  }
}
