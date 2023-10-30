import 'package:codefactory_riverpod/model/shopping_item_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final shoppingListProvider =
    StateNotifierProvider<ShoppingListNotifier, List<ShoppingItemModel>>(
        (ref) => ShoppingListNotifier());

// class ShoppingItemModel {
//   ShoppingItemModel({
//     required this.name,
//     required this.quantity,
//     required this.hasBought,
//     required this.isSpicy
//   });
//
//   final String name;
//   final int quantity;
//   final bool hasBought;
//   final bool isSpicy;
//
//   ShoppingItemModel copyWith({
//     String? name,
//     int? quantity,
//     bool? hasBought,
//     bool? isSpicy,
//   }) => ShoppingItemModel(
//     name: name ?? this.name,
//     quantity: quantity ?? this.quantity,
//     hasBought: hasBought ?? this.hasBought,
//     isSpicy: isSpicy ?? this.isSpicy,
//   );
// }

class ShoppingListNotifier extends StateNotifier<List<ShoppingItemModel>> {
  ShoppingListNotifier()
      : super([
          ShoppingItemModel(
              name: '김치', quantity: 3, hasBought: false, isSpicy: true),
          ShoppingItemModel(
              name: '라면', quantity: 5, hasBought: false, isSpicy: true),
          ShoppingItemModel(
              name: '삼겹살', quantity: 10, hasBought: false, isSpicy: false),
          ShoppingItemModel(
              name: '수박', quantity: 2, hasBought: false, isSpicy: false),
          ShoppingItemModel(
              name: '카스테라', quantity: 5, hasBought: false, isSpicy: false),
        ]);

  void toggleHasBought({required String name}) {
    state = state
        .map((e) => e.name == name
            ? ShoppingItemModel(
                name: name,
                quantity: e.quantity,
                hasBought: !e.hasBought,
                isSpicy: e.isSpicy)
            : e)
        .toList();
  }
}
