import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Flag Cards',
      home: FlagCardGrid(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FlagCardGrid extends StatelessWidget {
  final List<Map<String, String>> flags = [
    {'name': 'USA', 'url': 'https://flagcdn.com/w320/us.png'},
    {'name': 'UK', 'url': 'https://flagcdn.com/w320/gb.png'},
    {'name': 'Germany', 'url': 'https://flagcdn.com/w320/de.png'},
    {'name': 'France', 'url': 'https://flagcdn.com/w320/fr.png'},
    {'name': 'Bangladesh', 'url': 'https://flagcdn.com/w320/bd.png'},
    {'name': 'Japan', 'url': 'https://flagcdn.com/w320/jp.png'},
    {'name': 'Brazil', 'url': 'https://flagcdn.com/w320/br.png'},
    {'name': 'Canada', 'url': 'https://flagcdn.com/w320/ca.png'},
  ];

  int getCrossAxisCount(double width) {
    if (width > 1024) return 4;       // Desktop
    else if (width > 768) return 3;   // Tablet
    else return 2;                    // Mobile
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Responsive Flag Cards')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount = getCrossAxisCount(constraints.maxWidth);

          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: GridView.builder(
              itemCount: flags.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 3 / 4,
              ),
              itemBuilder: (context, index) {
                return FlagCard(
                  name: flags[index]['name']!,
                  imageUrl: flags[index]['url']!,
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class FlagCard extends StatelessWidget {
  final String name;
  final String imageUrl;

  FlagCard({required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              height: 130,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$name',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),
                Text(
                  'This is the flag of $name. It represents national pride.',
                  style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      'See Details',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.arrow_forward, color: Colors.blue, size: 16),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
///Tomal