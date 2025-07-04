import 'package:flutter/material.dart';

void main() {
  runApp(const LoidPage());
}

class LoidPage extends StatelessWidget {
  const LoidPage({super.key});

  @override
  Widget build(BuildContext context) {
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

    final theme = ThemeData(
      primaryColor: const Color.fromARGB(255, 20, 47, 225),
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 57, 123, 227),
        primary: const Color.fromARGB(255, 47, 164, 242),
        secondary: const Color.fromARGB(255, 30, 49, 255),
        background: const Color(0xFFFDF6FF),
      ),
      fontFamily: 'Montserrat',
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          fontSize: 16,
          color: Color.fromARGB(255, 35, 61, 255),
        ),
        titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 47, 102, 242),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: Scaffold(
        backgroundColor: theme.colorScheme.background,
        appBar: AppBar(
          title: const Text('Grid and ListView Mixed'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(
                'จัดอันดับภาพความน่ารัก',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              // GridView ด้านบน
              SizedBox(
                height: 180,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
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
              ),
              const SizedBox(height: 16),
              Text(
                "จัดอันดับภาพความน่ารัก",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              // ListView ด้านล่าง
              Expanded(
                child: ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: theme.colorScheme.secondary,
                          child: Text(
                            '${index + 1}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        title: Text(
                          'ภาพความน่ารักระดับ #${index + 1}',
                          style: theme.textTheme.bodyMedium,
                        ),
                        subtitle: Text('ความน่ารักระดับ ${index + 100} ดาว'),
                        trailing: const Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 224, 157, 12),
                        ),
                        onTap: () {},
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
