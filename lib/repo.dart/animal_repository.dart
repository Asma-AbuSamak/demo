import '../models/animal.dart';

abstract class IAnimalRepository {
  Future<List<Animal>> getAll();
  Future<Animal?> getById(String id);
  Future<void> add(Animal animal);
  Future<void> update(Animal animal);
  Future<void> delete(String id);
}