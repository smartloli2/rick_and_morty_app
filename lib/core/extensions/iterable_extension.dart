extension IterableExtensions<E> on Iterable<E> {
  E? firstOrNull([bool Function(E element)? test]) {
    if (test != null) return where(test).firstOr(null);
    return firstOr(null);
  }

  E? firstOr(E? or) {
    for (final E element in this) {
      return element;
    }
    return or;
  }

  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    int i = 0;
    return map((e) => f(e, i++));
  }
}
