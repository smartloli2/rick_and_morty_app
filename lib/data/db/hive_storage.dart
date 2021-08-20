import 'package:hive/hive.dart';

import 'i_storage.dart';

class HiveStorage<T> implements IStorage<T> {
  static const maxKeyLength = 255;

  @override
  final String boxName;

  final Future<Box<T>> _boxFuture;

  HiveStorage(this.boxName) : _boxFuture = Hive.openBox<T>(boxName);

  HiveStorage.future(this.boxName, this._boxFuture);

  @override
  Future<T?> get(String key) => _boxFuture.then((box) => box.get(key));

  @override
  Future<void> put(String key, T value) =>
      _boxFuture.then((box) => box.put(key, value));

  @override
  Future<void> remove(String key) => _boxFuture.then((box) => box.delete(key));

  @override
  Future<bool> isExist(String key) =>
      _boxFuture.then((box) => box.containsKey(key));

  @override
  Future<void> clear() => _boxFuture.then((box) => box.clear());

  @override
  Future<Iterable<String>> getKeys() => _boxFuture.then(
        (box) => box.keys.map((e) => e.toString()),
      );

  @override
  Future<int> getLength() => _boxFuture.then((box) => box.length);
}
