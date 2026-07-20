import 'package:insighta/repo.dart/animal_repository.dart';

import '../models/animal.dart';
import 'mock_data.dart';

class MockAnimalRepository implements IAnimalRepository {
  final List<Animal> _db = MockData.animals();

  Future<void> _delay() => Future.delayed(const Duration(milliseconds: 350));

  @override
  Future<List<Animal>> getAll() async {
    await _delay();
    return List.unmodifiable(_db);
  }

  @override
  Future<Animal?> getById(String id) async {
    await _delay();
    try {
      return _db.firstWhere((a) => a.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> add(Animal animal) async {
    await _delay();
    _db.add(animal);
  }

  @override
  Future<void> update(Animal animal) async {
    await _delay();
    final i = _db.indexWhere((a) => a.id == animal.id);
    if (i != -1) _db[i] = animal;
  }

  @override
  Future<void> delete(String id) async {
    await _delay();
    _db.removeWhere((a) => a.id == id);
  }
}