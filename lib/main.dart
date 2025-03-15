import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Card Matching Game'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> cardIds = [0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7];
  List<String> cardImages = [
    '🍏',
    '🍏',
    '🍉',
    '🍉',
    '🍒',
    '🍒',
    '🥝',
    '🥝',
    '🍇',
    '🍇',
    '🍍',
    '🍍',
    '🫛',
    '🫛',
    '🥕',
    '🥕'
  ];

  List<bool> flippedCard = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemCount: 16,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                setState(() {
                  flippedCard[index] = !flippedCard[index];
                });
              },
              child: Card(
                  margin: EdgeInsets.all(10),
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.blue,
                    child: flippedCard[index]
                        ? Text(cardImages[index])
                        : const Text("Card Front"),
                  )));
        },
      ),
    );
  }
}
