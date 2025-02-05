import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/models/user_model.dart';
import 'package:flutter_application_1/providers/favorite_provider.dart';
import 'package:flutter_application_1/widgets/user_item_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserListWidget extends ConsumerWidget  {
  final List<UserModel> users;
  final List<UserModel> favoriteUsers;

  const UserListWidget({super.key, required this.users, required this.favoriteUsers});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        final isFavorite = favoriteUsers.any((fav) => fav.id == user.id);

        return ItemCardWidget(
          user: user,
          isFavorite: isFavorite,
          onFavoriteToggle: () {
            final favoriteNotifier = ref.read(favoriteProvider.notifier);
            isFavorite
                ? favoriteNotifier.removeFavorite(user.id)
                : favoriteNotifier.addFavorite(user);
          },
        );
      },
    );
  }
}
