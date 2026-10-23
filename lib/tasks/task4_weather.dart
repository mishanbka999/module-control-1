
import 'dart:math';

// Сервіс для імітації отримання погоди
class WeatherService {
  final Random _random = Random();

  // Асинхронне отримання поточної погоди
  Future<Map<String, dynamic>> fetchCurrentWeather(
      String city,
      ) async {
    if (city.trim().isEmpty) {
      throw ArgumentError('Місто не вказано');
    }

    // Імітація затримки відповіді сервера
    await Future.delayed(const Duration(seconds: 2));

    return {
      'city': city.trim(),
      'temp': _random.nextInt(36),
      'condition': 'Сонячно',
    };
  }

  // Потік оновлень температури
  Stream<int> temperatureUpdates({int times = 5}) async* {
    if (times <= 0) return;

    for (int i = 0; i < times; i++) {
      await Future.delayed(const Duration(seconds: 1));

      // Генерація випадкової температури
      yield _random.nextInt(36);
    }
  }
}

// Демонстрація роботи сервісу
Future<void> runTask4() async {
  final service = WeatherService();

  print('=== ЗАВДАННЯ 4 ===');

  // Отримання погоди через async/await
  try {
    final weather = await service.fetchCurrentWeather('Київ');
    print('Поточна погода: $weather');
  } catch (e) {
    print('Помилка: $e');
  }

  print('Оновлення температури:');

  // Отримання даних через Stream
  await for (final temp
  in service.temperatureUpdates(times: 3)) {
    print('Температура: $temp°C');
  }

  // Перевірка обробки порожнього міста
  try {
    await service.fetchCurrentWeather('');
  } catch (e) {
    print('Очікувана помилка: $e');
  }

  // Перевірка потоку з нульовою кількістю оновлень
  await for (final temp
  in service.temperatureUpdates(times: 0)) {
    print('Температура: $temp°C');
  }

  print('Завдання 4 завершено!');
}
