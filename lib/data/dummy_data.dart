import '../models/category_model.dart';
import '../models/product_model.dart';

class DummyData {
  static List<String> locations = [
    'Kyoto, JPN',
    'Tokyo, JPN',
    'Osaka, JPN',
    'Kobe, JPN',
  ];

  static List<String> sliderImages = [
    'assets/sliders/slider_1.png',
    'assets/sliders/slider_2.png',
    'assets/sliders/slider_1.png',
    'assets/sliders/slider_2.png',
  ];

  static List<Category> categories = [
    Category(
      id: '1',
      name: 'Gohanmono',
      image: 'assets/categories/gohan.png',
      scale: 1.0,
      top: 10.0,
      left: 4.0,
      width: 51,
      height: 42,
    ),
    Category(
      id: '2',
      name: 'Men-rui',
      image: 'assets/categories/ramen.png',
      scale: 1.0,
      top: 1.0,
      left: 0.0,
      width: 64,
      height: 64,
    ),
    Category(
      id: '3',
      name: 'Sushi',
      image: 'assets/categories/sushi.png',
      scale: 1.0,
      top: 0.0,
      left: 0.0,
      width: 64,
      height: 64,
    ),
    Category(
      id: '4',
      name: 'Street Food',
      image: 'assets/categories/takoyaki.png',
      scale: 0.9,
      top: 0.0,
      left: 0.0,
      width: 64,
      height: 64,
    ),
    Category(
      id: '5',
      name: 'Minuman',
      image: 'assets/categories/matcha.png',
      scale: 1.0,
      top: 0.5,
      left: 6.0,
      width: 48,
      height: 59,
    ),
  ];

  static List<Product> featuredProducts = [
    Product(
      id: '1',
      name: 'Special Sushi',
      rating: 4.8,
      price: 'Rp 200.000',
      image: 'assets/featured/sushi_produck.png',
      category: 'Sushi',
    ),
    Product(
      id: '2',
      name: 'Ramen Naruto',
      rating: 4.5,
      price: 'Rp 200.000',
      image: 'assets/featured/ramen_product.png',
      category: 'Men-rui',
    ),
    Product(
      id: '3',
      name: 'Takoyaki Karai',
      rating: 4.4,
      price: 'Rp 200.000',
      image: 'assets/featured/takoyaki_product.png',
      category: 'Street Food',
    ),
    Product(
      id: '4',
      name: 'Matcha Rumput',
      rating: 4.3,
      price: 'Rp 200.000',
      image: 'assets/featured/matcha_product.png',
      category: 'Minuman',
    ),
  ];
}
