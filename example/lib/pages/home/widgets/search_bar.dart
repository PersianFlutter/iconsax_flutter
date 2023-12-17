import 'package:example/constants.dart';
import 'package:example/pages/home/home_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FlatSearchBar extends ConsumerWidget {
  const FlatSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Visibility(
      visible: ref.watch(showSearchBarProvider),
      child: Container(
        decoration: BoxDecoration(
          color: Constants.searchBarBackgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 50,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: TextFormField(
                  onChanged: (value) =>
                      ref.read(searchedIconQuery.notifier).state = value,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    hintText: "Search for icons",
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              IconButton(
                onPressed: () {
                  ref.read(showSearchBarProvider.notifier).state = false;
                  ref.read(searchedIconQuery.notifier).state = '';
                },
                icon: const Icon(
                  Icons.close_fullscreen,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
