import 'package:example/pages/home/home_providers.dart';
import 'package:example/pages/home/widgets/home_app_bar.dart';
import 'package:example/pages/home/widgets/icon_tile.dart';
import 'package:example/pages/home/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final list = Iconsax.items.entries.toList();
    final list = ref.watch(filteredListProvider);
    print(list);

    return Scaffold(
      appBar: const HomeAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 0.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const FlatSearchBar(),
            Expanded(
              child: GridView.builder(
                shrinkWrap: false,
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 100,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  final item = list[index];

                  return IconTile(item: item);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
