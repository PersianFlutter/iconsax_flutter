import 'package:example/constants.dart';
import 'package:example/pages/home/home_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils.dart';

class HomeAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key}) : super();

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var showSearchBar = ref.watch(showSearchBarProvider);
    return Container(
      color: Constants.appBarBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 32),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Iconsax Flutter",
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Constants.appBarForegroundColor,
                  ),
            ),
            Row(
              children: [
                if (!showSearchBar)
                  InkWell(
                    onTap: () {
                      ref.read(showSearchBarProvider.notifier).state = true;
                    },
                    borderRadius: BorderRadius.circular(50),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.search,
                        size: 30,
                        color: Constants.appBarForegroundColor,
                      ),
                    ),
                  ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () => openGithubRepo(),
                  borderRadius: BorderRadius.circular(50),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "images/github-mark.png",
                      width: 30,
                      color: Constants.appBarForegroundColor,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
