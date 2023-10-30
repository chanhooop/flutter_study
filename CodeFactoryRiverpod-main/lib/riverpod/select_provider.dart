import 'package:codefactory_riverpod/model/shopping_item_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectProvider = StateNotifierProvider<SelectNotifier, ShoppingItemModel>((ref) => SelectNotifier());

class SelectNotifier extends StateNotifier<ShoppingItemModel> {
  SelectNotifier(): super(
    ShoppingItemModel(name: '김치', quantity: 3, hasBought: false, isSpicy: true)
  );

  toggleHasBought() {
    state = state.copyWith(hasBought: !state.hasBought);
  }

  toggleIsSpicy() {
    state = state.copyWith(isSpicy: !state.isSpicy);
  }
}