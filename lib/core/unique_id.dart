import 'package:uuid/uuid.dart';

class UniqueId {
  final String value;

  factory UniqueId() {
    return UniqueId._(
      const Uuid().v1(),
    );
  }

  factory UniqueId.fromUniqueString(String uniqueId) {
    return UniqueId._(uniqueId);
  }

  factory UniqueId.fromUrl(String url) {
    return UniqueId._(const Uuid().v5(Uuid.NAMESPACE_URL, url));
  }

  const UniqueId._(this.value);
}
