import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IconTile extends StatelessWidget {
  const IconTile({super.key, required this.item});

  final MapEntry<String, IconData> item;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                item.value,
                size: 34,
                color: Colors.black,
              ),
              const SizedBox(height: 4),
              Text(
                item.key,
                style: Theme.of(context).textTheme.labelSmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
