class Category {
  final String id;
  final String name;
  final String image;
  final double scale;
  final double top;
  final double left;
  final double width;
  final double height;

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.scale,
    required this.top,
    required this.left,
    required this.width,
    required this.height,
  });

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      scale: (map['scale'] as num?)?.toDouble() ?? 1.0,
      top: (map['top'] as num?)?.toDouble() ?? 0.0,
      left: (map['left'] as num?)?.toDouble() ?? 0.0,
      width: (map['width'] as num?)?.toDouble() ?? 0.0,
      height: (map['height'] as num?)?.toDouble() ?? 0.0,
    );
  }
}