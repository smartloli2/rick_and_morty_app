import 'hive_storage.dart';
import 'i_storage.dart';
import 'i_storage_factory.dart';

class HiveStorageFactory implements IStorageFactory {
  @override
  IStorage<T> getStorage<T>(String boxName) => HiveStorage<T>(boxName);
}
