
import 'package:flutter/material.dart';

// Підключення всіх чотирьох завдань
import 'tasks/task1_library.dart';
import 'tasks/task2_rating.dart';
import 'tasks/task3_navigation.dart';
import 'tasks/task4_weather.dart';

// Точка входу в програму
void main() {
  runApp(const MyApp());
}

// Головний клас застосунку
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Модульний контроль №1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: const TaskMenu(),
    );
  }
}

// Головне меню з чотирма завданнями
class TaskMenu extends StatelessWidget {
  const TaskMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Модульний контроль №1'),
        centerTitle: true,
        backgroundColor:
        Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Завдання 1 — Класи та колекції Dart
            ElevatedButton(
              onPressed: () {
                runTask1();

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Завдання 1 виконано! Результат у консолі Run.',
                    ),
                  ),
                );
              },
              child: const Text('Завдання 1 — Бібліотека'),
            ),

            const SizedBox(height: 20),

            // Завдання 2 — StatelessWidget
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Task2Screen(),
                  ),
                );
              },
              child: const Text('Завдання 2 — Рейтинг'),
            ),

            const SizedBox(height: 20),

            // Завдання 3 — State Management і навігація
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
              child: const Text('Завдання 3 — Навігація'),
            ),

            const SizedBox(height: 20),

            // Завдання 4 — Асинхронний код
            ElevatedButton(
              onPressed: () async {
                // Запуск асинхронного сервісу погоди
                await runTask4();

                // Перевірка, чи віджет ще активний
                if (!context.mounted) return;

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Завдання 4 завершено! Результат у консолі Run.',
                    ),
                  ),
                );
              },
              child: const Text('Завдання 4 — Погода'),
            ),
          ],
        ),
      ),
    );
  }
}
