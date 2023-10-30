import 'package:codefactory_riverpod/model/shopping_item_model.dart';
import 'package:codefactory_riverpod/riverpod/state_notifier_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final filteredShoppingListProvider = Provider<List<ShoppingItemModel>>(
  (ref) {
    final filterState = ref.watch(filterProvider);
    final shoppingListState = ref.watch(shoppingListProvider);
    if (filterState == FilterState.all) {
      return shoppingListState;
    }
    return shoppingListState.where((e) =>
      filterState == FilterState.spicy
        ? e.isSpicy
        : !e.isSpicy
    ).toList();
    return [];
  },
);

enum FilterState{
  notSpicy,
  spicy,
  all,
}

final filterProvider = StateProvider<FilterState>((ref) => FilterState.all);