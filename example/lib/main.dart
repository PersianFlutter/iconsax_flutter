import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Iconsax Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final list = Iconsax.items.entries.toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Iconsax Flutter'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: OutlinedButton.icon(
              label: const Text('Source Code'),
              onPressed: () {
                openGithubRepo();
              },
              icon: const Icon(Iconsax.facebook),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Give a Star'),
        icon: const Icon(Icons.gite),
        onPressed: () {
          openGithubRepo();
        },
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(32.0),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 100,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: list.length,
        itemBuilder: (context, index) {
          final item = list[index];

          return Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(color: Colors.grey),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () async {
                final clipBoardValue = 'Iconsax.${item.key}';

                Clipboard.setData(ClipboardData(text: clipBoardValue));

                ScaffoldMessenger.of(context).clearSnackBars();

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Row(
                      children: [
                        Icon(
                          item.value,
                          size: 34,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 8),
                        Text('$clipBoardValue added to ClipBoard'),
                      ],
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      item.value,
                      size: 34,
                      color: const Color.fromARGB(221, 59, 59, 59),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.key,
                      style: Theme.of(context).textTheme.bodyLarge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> openGithubRepo() async {
    final Uri url =
        Uri.parse('https://github.com/PersianFlutter/iconsax_flutter');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
