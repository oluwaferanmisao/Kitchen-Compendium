class Ingredient {
  final String name;
  final String amount;
  final String? unit; // Optional unit of measurement

  Ingredient({
    required this.name,
    required this.amount,
    this.unit,
  });

  // Convert Map (from Firestore) to Ingredient object
  factory Ingredient.fromMap(Map<String, dynamic> map) {
    return Ingredient(
      name: map['name'] ?? '',
      amount: map['amount'] ?? '',
      unit: map['unit'],
    );
  }

  // Convert Ingredient object to Map (for Firestore)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'amount': amount,
      'unit': unit,
    };
  }
}
