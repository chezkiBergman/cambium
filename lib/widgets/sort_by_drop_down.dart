import 'package:flutter/material.dart';
import 'package:flutter_application_1/generated/l10n.dart';
import 'package:flutter_application_1/providers/search_query.dart';
import 'package:flutter_application_1/widgets/shadow_decoration.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SortDropdownWidget extends ConsumerWidget {
  const SortDropdownWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sortOption = ref.watch(sortOptionProvider);

    return Container(
      height: 50,
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
      ),
      child: Stack(
        children: [
          const ShadowDecoration(
            radiusCircular: 22,
            height: 50,
          ),
          DropdownButtonFormField<int>(
            borderRadius: BorderRadius.circular(22),
            value: sortOption,
            onChanged: (int? newValue) {
              if (newValue != null) {
                ref.read(sortOptionProvider.notifier).state = newValue;
                ref.read(searchProvider.notifier).state = '';
              }
            },
            decoration:  InputDecoration(
              contentPadding: const EdgeInsetsDirectional.only(
                  top: 5, bottom: 5, start: 15, end: 10),
              labelText:S.current.sort ,
              border: InputBorder.none,
             
            ),isExpanded: true,
            items:  [
              DropdownMenuItem( value: 0, child: Text(S.current.without_sort)),
              DropdownMenuItem(value: 1, child: Text(S.current.young_to_old)),
              DropdownMenuItem(value: 2, child: Text(S.current.old_young_to)),
            ],
          ),
        ],
      ),
    );
  }
}
