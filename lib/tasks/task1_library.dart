
abstract class LibraryItem {
  final String title;
  final int year;

  LibraryItem({required this.title, required this.year});

  String describe();
}

class Book extends LibraryItem {
  final String author;

  Book({
    required super.title,
    required super.year,
    required this.author,
  });

  @override
  String describe() => '$title ($year) — $author';
}

class Magazine extends LibraryItem {
  final int issueNumber;

  Magazine({
    required super.title,
    required super.year,
    required this.issueNumber,
  });

  @override
  String describe() => '$title ($year), випуск $issueNumber';
}

class Library {
  final List<LibraryItem> _items = [];

  void addItem(LibraryItem item) {
    _items.add(item);
  }

  List<LibraryItem> findByYear(int year) {
    return _items.where((item) => item.year == year).toList();
  }

  List<String> get allDescriptions {
    return _items.map((item) => item.describe()).toList();
  }

  LibraryItem? findOldest() {
    if (_items.isEmpty) return null;

    LibraryItem oldest = _items.first;
    for (final item in _items.skip(1)) {
      if (item.year < oldest.year) {
        oldest = item;
      }
    }
    return oldest;
  }
}

void runTask1() {
  final library = Library();

  library.addItem(Book(
    title: 'Dart у дії',
    year: 2022,
    author: 'І. Петренко',
  ));

  library.addItem(Magazine(
    title: 'Mobile Dev',
    year: 2023,
    issueNumber: 5,
  ));

  library.addItem(Book(
    title: 'Основи Flutter',
    year: 2021,
    author: 'О. Коваленко',
  ));

  print('=== ЗАВДАННЯ 1 ===');

  for (final description in library.allDescriptions) {
    print(description);
  }

  print('За 2022 рік:');
  for (final item in library.findByYear(2022)) {
    print(item.describe());
  }

  print('Найстаріший: ${library.findOldest()?.describe()}');

  // Перевірка порожньої бібліотеки
  print('Порожня бібліотека: ${Library().findOldest()}');
}
