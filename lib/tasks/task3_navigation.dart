
import 'package:flutter/material.dart';

// Головний екран із лічильником
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;

  // Збільшення лічильника
  void increment() {
    setState(() {
      counter++;
    });
  }

  // Перехід на екран деталей
  void openDetails() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(count: counter),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Головний екран'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Лічильник: $counter',
              style: const TextStyle(fontSize: 28),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: increment,
              child: const Text('+1'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: openDetails,
              child: const Text('Детальніше'),
            ),
          ],
        ),
      ),
    );
  }
}

// Екран деталей
class DetailScreen extends StatelessWidget {
  final int count;

  const DetailScreen({
    super.key,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Деталі'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Значення лічильника: $count',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Назад'),
            ),
          ],
        ),
      ),
    );
  }
}
