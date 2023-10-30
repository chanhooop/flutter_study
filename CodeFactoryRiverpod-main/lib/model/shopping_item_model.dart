class ShoppingItemModel {
  ShoppingItemModel({
    required this.name,
    required this.quantity,
    required this.hasBought,
    required this.isSpicy
  });

  final String name;
  final int quantity;
  final bool hasBought;
  final bool isSpicy;

  ShoppingItemModel copyWith({
    String? name,
    int? quantity,
    bool? hasBought,
    bool? isSpicy,
  }) => ShoppingItemModel(
    name: name ?? this.name,
    quantity: quantity ?? this.quantity,
    hasBought: hasBought ?? this.hasBought,
    isSpicy: isSpicy ?? this.isSpicy,
  );
}