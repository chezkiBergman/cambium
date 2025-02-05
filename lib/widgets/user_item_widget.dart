import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/models/user_model.dart';
import 'package:flutter_application_1/generated/l10n.dart';
import 'package:flutter_application_1/providers/favorite_provider.dart';
import 'package:flutter_application_1/utils/theme_colors.dart';
import 'package:flutter_application_1/widgets/custom_card_decoration.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemCardWidget extends ConsumerWidget {
  final UserModel user;
  final VoidCallback onFavoriteToggle;
  final bool isFavorite;
  const ItemCardWidget({
    super.key,
    required this.user,
    required this.onFavoriteToggle,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomCardDecoration(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          avatarImg(isFavorite, ref),
          colorLineCarStatus(),
          datailsUser(),
        ],
      ),
    );
  }

  Widget avatarImg(bool isFavorite, WidgetRef ref) {
    final Uri? avatarUri = Uri.tryParse(user.avatar);


    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: CustomColors.backgroundColorApp,
            radius: 30,
            child: ClipOval(
              child: CachedNetworkImage(
                imageRenderMethodForWeb: ImageRenderMethodForWeb.HttpGet,
                imageUrl: avatarUri.toString(),
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          iconSelectFavorite(isFavorite, ref),
        ],
      ),
    );
  }

  Widget iconSelectFavorite(bool isFavorite, WidgetRef ref) {
    return IconButton(
      icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red),
      onPressed: () {
        final notifier = ref.read(favoriteProvider.notifier);
        isFavorite
            ? notifier.removeFavorite(user.id)
            : notifier.addFavorite(user);
      },
    );
  }

  Widget datailsUser() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${user.first_name} ${user.last_name}",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 4),
          Text(
            '${S.current.date_of_birth} ${user.date_of_birth}',
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget colorLineCarStatus() {
    return Container(
      width: double.infinity,
      height: 2.0,
      decoration: const BoxDecoration(
        color: CustomColors.backgroundColorApp,
       
      ),
    );
  }
}
