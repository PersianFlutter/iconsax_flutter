import 'package:example/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class IconTile extends HookWidget {
  const IconTile({super.key, required this.item});

  final MapEntry<String, IconData> item;

  @override
  Widget build(BuildContext context) {
    var hovered = useState(false);
    return MouseRegion(
      onEnter: (event) => hovered.value = true,
      onExit: (event) => hovered.value = false,
      child: Material(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            width: hovered.value ? 2 : 1,
            color: Constants.seedColor.withOpacity(
              hovered.value ? .7 : .2,
            ),
          ),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () async {
            final clipBoardValue = 'Iconsax.${item.key}';

            Clipboard.setData(ClipboardData(text: clipBoardValue));

            ScaffoldMessenger.of(context).clearSnackBars();

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Constants.seedColor,
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
                  size: 35,
                  color: Constants.seedColor,
                ),
                const SizedBox(height: 4),
                if (hovered.value)
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
      ),
    );
  }
}
