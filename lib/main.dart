import 'package:flutter/material.dart';

void main(){
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ResponsiveFlagsPage(),
  ));
}

class ResponsiveFlagsPage extends StatelessWidget{
  const ResponsiveFlagsPage({super.key});
  final List<Map<String, String>> countries = const[
    {"name": "Bangladesh", "url": "https://flagcdn.com/w320/bd.png"},
    {"name": "Pakistan", "url": "https://flagcdn.com/w320/pk.png"},
    {"name": "Japan", "url": "https://flagcdn.com/w320/jp.png"},
    {"name": "Germany", "url": "https://flagcdn.com/w320/de.png"},
    {"name": "Poland", "url": "https://flagcdn.com/w320/pl.png"},
    {"name": "Switzerland", "url": "https://flagcdn.com/w320/ch.png"},
    {"name": "Australia", "url": "https://flagcdn.com/w320/au.png"},
    {"name": "Hungary", "url": "https://flagcdn.com/w320/hu.png"},
    {"name": "Indonesia", "url": "https://flagcdn.com/w320/id.png"},
    {"name": "South Korea", "url": "https://flagcdn.com/w320/kr.png"},
    {"name": "Malaysia", "url": "https://flagcdn.com/w320/my.png"},
    {"name": "Turkey", "url": "https://flagcdn.com/w320/tr.png"},
    {"name": "Netherlands", "url": "https://flagcdn.com/w320/nl.png"},
    {"name": "United Kingdom", "url": "https://flagcdn.com/w320/gb.png"},
    {"name": "Portugal", "url": "https://flagcdn.com/w320/pt.png"},
    {"name": "Spain", "url": "https://flagcdn.com/w320/es.png"},
    {"name": "Italy", "url": "https://flagcdn.com/w320/it.png"},
    {"name": "Morocco", "url": "https://flagcdn.com/w320/ma.png"},
  ];

  int _getCrossAxisCount(double width){
    if (width < 768){
      return 2;
    }
    else if (width <= 1024){
      return 3;
    }
    else{
      return 4;
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Responsive Design"),
        backgroundColor: Colors.blueAccent,
      ),
      body: LayoutBuilder(
        builder: (context, constraints){
          int crossAxisCount = _getCrossAxisCount(constraints.maxWidth);

          return GridView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: countries.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 3 / 2,
            ),
            itemBuilder: (context, index){
              final country = countries[index];
              return CountryCard(
                name: country['name']!,
                flagUrl: country['url']!,
              );
            },
          );
        },
      ),
    );
  }
}

class CountryCard extends StatelessWidget{
  final String name;
  final String flagUrl;

  const CountryCard({
    super.key,
    required this.name,
    required this.flagUrl,
  });

  @override
  Widget build(BuildContext context){
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                flagUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          ElevatedButton(
            onPressed:(){},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 185, 179, 179),
              foregroundColor: const Color.fromARGB(255, 0, 0, 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: const Text("Details", style: TextStyle(fontSize: 15)),
          ),
        ],
      ),
    );
  }
}