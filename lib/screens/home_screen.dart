import 'package:flutter/material.dart';
import 'package:flutter_application_1/generated/l10n.dart';
import 'package:flutter_application_1/providers/search_query.dart';
import 'package:flutter_application_1/providers/favorite_provider.dart';
import 'package:flutter_application_1/widgets/sort_by_drop_down.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/user_provider.dart';
import '../widgets/shadow_decoration.dart';
import '../widgets/user_list_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          const SortDropdownWidget(),
          const SizedBox(height: 15),
          sortBySearch(ref, context),
          const SizedBox(height: 20),
          listBuilder(ref)
        ],
      ),
    );
  }

  Widget listBuilder(WidgetRef ref) {
    final usersAsync = ref.watch(userNotifierProvider);
    final favoriteUsers = ref.watch(favoriteProvider).asData?.value ?? [];
    final filteredUsers = ref.watch(filteredUsersProvider);

    return Expanded(
      child: usersAsync.when(
        data: (users) => RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(userNotifierProvider);
            ref.read(sortOptionProvider.notifier).state = 0;
            ref.read(searchProvider.notifier).state = '';
          },
          child: UserListWidget(
              users: filteredUsers, favoriteUsers: favoriteUsers),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => const Center(child: Text("Error loading users")),
      ),
    );
  }

  Widget sortBySearch(WidgetRef ref, BuildContext context) {
    return Container(
      height: 50,
      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
      child: Stack(
        children: [
          const ShadowDecoration(
            radiusCircular: 22,
          ),
          TextFormField(
            onChanged: (value) {
              ref.read(searchProvider.notifier).state = value;
              ref.read(sortOptionProvider.notifier).state = 0;
            },
            decoration:  InputDecoration(
              contentPadding: const EdgeInsetsDirectional.only(
                  top: 5, bottom: 5, start: 15, end: 10),
              labelText:S.current.search_placeholder,
              border: InputBorder.none,
              suffixIcon: const Icon(Icons.search),
            ),
          ),
        ],
      ),
    );
  }
}
