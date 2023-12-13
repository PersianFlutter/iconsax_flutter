import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../utils.dart';

class HomeAppBar extends HookWidget {
  const HomeAppBar({super.key}) : super();

  @override
  Widget build(BuildContext context) {
    var searchBarExpanded = useState(false);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 32),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const FlutterLogo(
                    size: 35,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(Icons.add),
                  const SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    "images/iconbl.png",
                    width: 150,
                  ),
                ],
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      searchBarExpanded.value = !searchBarExpanded.value;
                    },
                    borderRadius: BorderRadius.circular(50),
                    child: const Icon(
                      Icons.search,
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () => openGithubRepo(),
                    borderRadius: BorderRadius.circular(50),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.asset(
                            "images/github-mark.png",
                            width: 30,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Source code",
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          if (searchBarExpanded.value)
            TextFormField(
              decoration: const InputDecoration(
                label: Text("E.x. airdrop ..."),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
