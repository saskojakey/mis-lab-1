class Clothes {
  int id;
  String name;
  String? price;

  Clothes({required this.id, required this.name, this.price});

  Clothes copyWith({
    int? id,
    String? name,
    String? price,
  }) {
    return Clothes(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
    );
  }
}
