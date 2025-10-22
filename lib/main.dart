import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: Oishii());
  }
}

class Oishii extends StatefulWidget {
  const Oishii({super.key});

  @override
  State<Oishii> createState() => _OishiiState();
}

class _OishiiState extends State<Oishii> {
  String selectedLocation = 'Kyoto, JPN';
  int _selectedIndex = 0; // State untuk bottom navigation

  final List<String> locations = [
    'Kyoto, JPN',
    'Tokyo, JPN',
    'Osaka, JPN',
    'Kobe, JPN',
  ];

  late PageController _pageController;
  int _currentPage = 0;
  Timer? _timer;

  final List<String> sliderImages = [
    'assets/sliders/slider_1.png',
    'assets/sliders/slider_2.png',
    'assets/sliders/slider_1.png',
    'assets/sliders/slider_2.png',
  ];

  final List<Map<String, dynamic>> categories = [
    {
      'name': 'Gohanmono',
      'image': 'assets/categories/gohan.png',
      'scale': 1.0,
      'top': 10.0,
      'left': 4.0,
      'width': 51,
      'height': 42,
    },
    {
      'name': 'Men-rui',
      'image': 'assets/categories/ramen.png',
      'scale': 1.0,
      'top': 1.0,
      'left': 0.0,
      'width': 64,
      'height': 64,
    },
    {
      'name': 'Sushi',
      'image': 'assets/categories/sushi.png',
      'scale': 1.0,
      'top': 0.0,
      'left': 0.0,
      'width': 64,
      'height': 64,
    },
    {
      'name': 'Street Food',
      'image': 'assets/categories/takoyaki.png',
      'scale': 0.9,
      'top': 0.0,
      'left': 0.0,
      'width': 64,
      'height': 64,
    },
    {
      'name': 'Minuman',
      'image': 'assets/categories/matcha.png',
      'scale': 1.0,
      'top': 0.5,
      'left': 6.0,
      'width': 48,
      'height': 59,
    },
  ];

  final List<Map<String, dynamic>> featuredProduct = [
    {
      'image': 'assets/featured/sushi_produck.png',
      'name': 'Special Sushi',
      'rating': 4.8,
      'price': 'Rp 200.000',
    },
    {
      'image': 'assets/featured/ramen_product.png',
      'name': 'Ramen Naruto',
      'rating': 4.5,
      'price': 'Rp 200.000',
    },
    {
      'image': 'assets/featured/takoyaki_product.png',
      'name': 'Takoyaki Karai',
      'rating': 4.4,
      'price': 'Rp 200.000',
    },
    {
      'image': 'assets/featured/matcha_product.png',
      'name': 'Matcha Rumput',
      'rating': 4.3,
      'price': 'Rp 200.000',
    },
  ];

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFFB11E23), // warna merah seperti AppBar
        statusBarIconBrightness:
            Brightness.light, // teks/icon status bar jadi putih
      ),
    );
    _pageController = PageController(initialPage: 0);

    // Auto-slide setiap 10 detik
    _timer = Timer.periodic(const Duration(seconds: 10), (Timer timer) {
      if (_currentPage < sliderImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  // Method untuk handle tap bottom navigation (hanya visual)
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Tidak ada navigasi ke screen lain, hanya mengubah state untuk visual
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F3E9),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔴 Bagian atas (AppBar custom)
            Container(
              height: 198,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                color: Color(0xFFB11E23),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(26),
                  bottomLeft: Radius.circular(26),
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/Logo_Oishii.png', height: 85),
                        Padding(
                          padding: const EdgeInsets.only(left: 155, top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Transform.translate(
                                offset: Offset(0, 7),
                                child: Text(
                                  'ANTAR KE:',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.white.withOpacity(0.8),
                                  ),
                                  const SizedBox(width: 8),
                                  DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: selectedLocation,
                                      icon: const Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.white,
                                      ),
                                      dropdownColor: const Color(0xFFB11E23),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      items: locations.map((String location) {
                                        return DropdownMenuItem<String>(
                                          value: location,
                                          child: Text(location),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          selectedLocation = newValue!;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 47,
                      child: TextField(
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: const TextStyle(
                            color: Colors.white54,
                            fontSize: 15,
                          ),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 20,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.white24,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 🟢 Special Offers Section
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Judul + tombol See All
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Special Offers',
                        style: TextStyle(
                          color: Color(0xFF2E2E2E),
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Text(
                          'See All',
                          style: TextStyle(
                            color: Color(0xFFB11E23),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // 🖼️ Slider
                  Column(
                    children: [
                      SizedBox(
                        height: 180,
                        child: PageView.builder(
                          controller: _pageController,
                          onPageChanged: (index) {
                            setState(() {
                              _currentPage = index;
                            });
                          },
                          itemCount: sliderImages.length,
                          itemBuilder: (context, index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(18),
                              child: Image.asset(
                                sliderImages[index],
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(sliderImages.length, (index) {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 350),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            height: 8,
                            width: _currentPage == index ? 12 : 8,
                            decoration: BoxDecoration(
                              color: _currentPage == index
                                  ? const Color(0xFFB11E23)
                                  : const Color(0xFFBDBDBD),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),
                  // 🟡 Categories Section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Categories',
                              style: TextStyle(
                                color: Color(0xFF2F2F2F),
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: const Text(
                                'See All',
                                style: TextStyle(
                                  color: Color(0xFFB11E23),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
                              // mainAxisSpacing: 8,
                              childAspectRatio: 0.8,
                            ),
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          final category = categories[index];
                          return Column(
                            children: [
                              Container(
                                width: 64,
                                height: 64,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 4,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: ClipOval(
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        top: category['top'],
                                        left: category['left'],
                                        child: Transform.scale(
                                          scale: category['scale'],
                                          child: SizedBox(
                                            width: category['width']
                                                ?.toDouble(),
                                            height: category['height']
                                                ?.toDouble(),
                                            child: Image.asset(
                                              category['image'],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                category['name'],
                                style: const TextStyle(
                                  color: Color(0xFF2F2F2F),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // 🟢 Featured Products Section
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Featured Product',
                    style: TextStyle(
                      color: Color(0xFF2E2E2E),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(
                      'See All',
                      style: TextStyle(color: Color(0xFFB11E23), fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 16),
                itemCount: featuredProduct.length,
                itemBuilder: (context, index) {
                  final product = featuredProduct[index];
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 254,
                      margin: EdgeInsets.only(
                        right: index == featuredProduct.length - 1 ? 16 : 12,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 254,
                                height: 157,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 6,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    product['image'],
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 8,
                                left: 8,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF7F3E9),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Color(0xFFFFD700),
                                        size: 18,
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        product['rating'].toString(),
                                        style: const TextStyle(
                                          color: Color(0xFF2F2F2F),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            product['name'],
                            style: const TextStyle(
                              color: Color(0xFF2F2F2F),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            product['price'],
                            style: const TextStyle(
                              color: Color(0xFFB11E23),
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // SizedBox(height: 80),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.only(
            topLeft: Radius.circular(26),
            topRight: Radius.circular(26),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color(0xFFF7F3E9),
            selectedItemColor: const Color(0xFFB11E23),
            unselectedItemColor: const Color(0xFF9E9E9E),
            selectedLabelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            currentIndex: _selectedIndex,
            onTap: _onItemTapped, // Hanya mengubah visual, tidak navigasi
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.restaurant_menu_outlined),
                activeIcon: Icon(Icons.restaurant_menu),
                label: 'Menu',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                activeIcon: Icon(Icons.shopping_cart),
                label: 'Keranjang',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outlined),
                activeIcon: Icon(Icons.person),
                label: 'Profil',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
