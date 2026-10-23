
import 'package:flutter/material.dart';

class RatingBadge extends StatelessWidget {
  final double rating;
  final String? label;

  const RatingBadge({
    super.key,
    required this.rating,
    this.label,
  }) : assert(rating >= 0.0 && rating <= 5.0);

  Color get starColor {
    if (rating >= 4.0) return Colors.green;
    if (rating >= 2.5) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.star, color: starColor, size: 32),
            const SizedBox(width: 8),
            Text(
              rating.toStringAsFixed(1),
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
        if (label != null) ...[
          const SizedBox(height: 6),
          Text(label!),
        ],
      ],
    );
  }
}

class Task2Screen extends StatelessWidget {
  const Task2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Завдання 2 — Рейтинг'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RatingBadge(rating: 4.7, label: 'Відмінно'),
            SizedBox(height: 30),
            RatingBadge(rating: 3.2, label: 'Добре'),
            SizedBox(height: 30),
            RatingBadge(rating: 1.2),
          ],
        ),
      ),
    );
  }
}
