import 'i_storage.dart';

abstract class IStorageFactory {
  IStorage<T> getStorage<T>(String key);

  // IStorage<T> getCachedStorage<T>(String key, T Function(dynamic) fromJson);
}
