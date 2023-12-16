import 'package:flutter_riverpod/flutter_riverpod.dart';

final showSearchBarProvider = StateProvider<bool>((ref) {
  return false;
});

final iconListProvider = StateProvider((ref) => []);

final filteredListProvider = StateProvider((ref) => []);
