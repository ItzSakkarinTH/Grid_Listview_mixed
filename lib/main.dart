import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const PrincessLoidApp());
}

class PrincessLoidApp extends StatelessWidget {
  const PrincessLoidApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(),
      home: const PrincessLoidHomePage(),
    );
  }

  ThemeData _buildTheme() {
    return ThemeData(
      primarySwatch: Colors.pink,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFFE91E63),
        onPrimary: Colors.white,
        secondary: Color(0xFFFFC107),
        onSecondary: Colors.black,
        surface: Color(0xFFFFF8E1),
        onSurface: Color(0xFF2D1B69),
        background: Color(0xFFFDF2F8),
        onBackground: Color(0xFF2D1B69),
        error: Color(0xFFB00020),
        onError: Colors.white,
      ),
      fontFamily: 'Montserrat',
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Color(0xFF2D1B69),
          letterSpacing: 1.2,
        ),
        headlineMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: Color(0xFF2D1B69),
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: Color(0xFF2D1B69),
          fontWeight: FontWeight.w500,
        ),
        bodyMedium: TextStyle(fontSize: 14, color: Color(0xFF6A4C93)),
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Color(0xFFE91E63),
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 8,
        shadowColor: Colors.pink.withOpacity(0.3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}

class PrincessLoidHomePage extends StatefulWidget {
  const PrincessLoidHomePage({super.key});

  @override
  State<PrincessLoidHomePage> createState() => _PrincessLoidHomePageState();
}

class _PrincessLoidHomePageState extends State<PrincessLoidHomePage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  final Random _random = Random();

  final List<String> imageList = [
    'assets/images/img1.png',
    'assets/images/img2.png',
    'assets/images/img3.png',
    'assets/images/img4.png',
    'assets/images/img5.png',
    'assets/images/img6.png',
    'assets/images/img7.png',
    'assets/images/img8.png',
    'assets/images/img9.png',
    'assets/images/img10.png',
  ];

  final List<String> princessNames = [
    'Princess of CS66 boy',
    'Princess of CS66 Koko',
    'Princess of CS66 louis',
    'Princess of CS66 Lad',
    'Princess of CS66 opow',
    'Princess of CS66 non',
    'Princess of CS66 ads',
  ];

  final List<Color> princessColors = [
    Color(0xFFFFB6C1), // Light Pink
    Color(0xFFDDA0DD), // Plum
    Color(0xFF98FB98), // Pale Green
    Color(0xFFFFE4B5), // Moccasin
    Color(0xFFB0E0E6), // Powder Blue
    Color(0xFFF0E68C), // Khaki
    Color(0xFFDEB887), // Burlywood
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('👑 7 Princess of CS66'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFE91E63), Color(0xFFAD1457)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildHeader(),
                  const SizedBox(height: 20),
                  _buildGridView(),
                  const SizedBox(height: 24),
                  _buildListHeader(),
                  const SizedBox(height: 16),
                  _buildPrincessList(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFFE0E6), Color(0xFFFFF0F5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.pink.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          const Icon(Icons.auto_awesome, size: 32, color: Color(0xFFE91E63)),
          const SizedBox(height: 8),
          Text(
            'จัดอันดับความน่ารัก',
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            '7 อันดับความน่ารักของวัยรุ่นวิทย์คอม',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildGridView() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1,
        ),
        itemCount: imageList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.deepPurpleAccent,
            child: Center(child: Image.asset(imageList[index])),
          );
        },
      ),
    );
  }

  Widget _buildGridItem(int index) {
    return Hero(
      tag: 'grid_$index',
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                princessColors[index % princessColors.length],
                princessColors[index % princessColors.length].withOpacity(0.7),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Stack(
            children: [
              Center(
                child: Icon(
                  Icons.image,
                  size: 40,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              Positioned(
                bottom: 4,
                right: 4,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D1B69),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListHeader() {
    return Row(
      children: [
        const Icon(
          Icons.format_list_numbered,
          color: Color(0xFFE91E63),
          size: 28,
        ),
        const SizedBox(width: 12),
        Text(
          'จัดอันดับความน่ารัก',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFFE91E63),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            '7 อันดับ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPrincessList() {
    return Expanded(
      child: ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) {
          return _buildPrincessItem(index);
        },
      ),
    );
  }

  Widget _buildPrincessItem(int index) {
    final princess = princessNames[index];
    final color = princessColors[index];
    final stars = 5 - (index * 0.5);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Hero(
        tag: 'princess_$index',
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () => _showPrincessDetail(index),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [color.withOpacity(0.1), color.withOpacity(0.05)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: _buildRankBadge(index),
                title: Text(
                  princess,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    Text(
                      'ความน่ารักระดับ ${stars.toStringAsFixed(1)} ดาว',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: List.generate(5, (i) {
                        return Icon(
                          i < stars ? Icons.star : Icons.star_border,
                          color: const Color(0xFFFFD700),
                          size: 16,
                        );
                      }),
                    ),
                  ],
                ),
                trailing: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Color(0xFFE91E63),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRankBadge(int index) {
    final color = princessColors[index];
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color, color.withOpacity(0.7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.4),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Center(
            child: Text(
              '${index + 1}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (index < 3)
            Positioned(
              top: 2,
              right: 2,
              child: Icon(
                Icons.workspace_premium,
                size: 16,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
        ],
      ),
    );
  }

  void _showPrincessDetail(int index) {
    final randomImageIndex = _random.nextInt(imageList.length);
    final princess = princessNames[index];
    final color = princessColors[index];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color.withOpacity(0.1), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: color.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      imageList[randomImageIndex],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  princess,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'อันดับที่ ${index + 1}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.auto_awesome,
                        color: Color(0xFFE91E63),
                        size: 24,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'รูปภาพ: ${imageList[randomImageIndex]}',
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE91E63),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'ปิด',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
