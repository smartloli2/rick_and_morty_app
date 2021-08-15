abstract class IStorage<T> {
  String get boxName;

  Future<T?> get(String key);

  Future<void> put(String key, T value);

  Future<void> remove(String key);

  Future<Iterable<String>> getKeys();

  Future<int> getLength();

  Future<bool> isExist(String key);

  Future<void> clear();
}
