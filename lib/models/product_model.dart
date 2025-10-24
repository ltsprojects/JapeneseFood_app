class Product {
  final String id;
  final String name;
  final double rating;
  final String price;
  final String image;
  final String? description;
  final String category;

  Product({
    required this.id,
    required this.name,
    required this.rating,
    required this.price,
    required this.image,
    this.description,
    required this.category,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      rating: (map['rating'] as num?)?.toDouble() ?? 0.0,
      price: map['price'] ?? '',
      image: map['image'] ?? '',
      description: map['description'],
      category: map['category'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'rating': rating,
      'price': price,
      'image': image,
      'description': description,
      'category': category,
    };
  }
}