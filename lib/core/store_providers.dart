import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import 'di.dart';

class StoreProvider1<TStore extends Store> extends StatelessWidget {
  final Widget child;
  final void Function(TStore)? onStoreCreated;
  final bool? lazy;

  const StoreProvider1({
    required this.child,
    this.onStoreCreated,
    this.lazy,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) => _createStoreProvider<TStore>(
        context: context,
        child: child,
        onStoreCreated: onStoreCreated,
        lazy: lazy,
      ),
    );
  }
}

class StoreProvider2<TStore1 extends Store, TStore2 extends Store>
    extends StatelessWidget {
  final Widget child;
  final void Function(TStore1)? onStore1Created;
  final void Function(TStore2)? onStore2Created;
  final bool? lazy;

  const StoreProvider2({
    required this.child,
    this.onStore1Created,
    this.onStore2Created,
    this.lazy,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) => MultiProvider(
        providers: [
          _createStoreProvider<TStore1>(
              context: context, onStoreCreated: onStore1Created, lazy: lazy),
          _createStoreProvider<TStore2>(
              context: context, onStoreCreated: onStore2Created, lazy: lazy),
        ],
        child: child,
      ),
    );
  }
}

class StoreProvider3<TStore1 extends Store, TStore2 extends Store,
    TStore3 extends Store> extends StatelessWidget {
  final Widget child;
  final void Function(TStore1)? onStore1Created;
  final void Function(TStore2)? onStore2Created;
  final void Function(TStore3)? onStore3Created;
  final bool? lazy;

  const StoreProvider3({
    required this.child,
    this.onStore1Created,
    this.onStore2Created,
    this.onStore3Created,
    this.lazy,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) => MultiProvider(
        providers: [
          _createStoreProvider<TStore1>(
              context: context, onStoreCreated: onStore1Created, lazy: lazy),
          _createStoreProvider<TStore2>(
              context: context, onStoreCreated: onStore2Created, lazy: lazy),
          _createStoreProvider<TStore3>(
              context: context, onStoreCreated: onStore3Created, lazy: lazy),
        ],
        child: child,
      ),
    );
  }
}

class StoreProvider4<TStore1 extends Store, TStore2 extends Store,
    TStore3 extends Store, TStore4 extends Store> extends StatelessWidget {
  final Widget child;
  final void Function(TStore1)? onStore1Created;
  final void Function(TStore2)? onStore2Created;
  final void Function(TStore3)? onStore3Created;
  final void Function(TStore4)? onStore4Created;
  final bool? lazy;

  const StoreProvider4({
    required this.child,
    this.onStore1Created,
    this.onStore2Created,
    this.onStore3Created,
    this.onStore4Created,
    this.lazy,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) => MultiProvider(
        providers: [
          _createStoreProvider<TStore1>(
              context: context, onStoreCreated: onStore1Created, lazy: lazy),
          _createStoreProvider<TStore2>(
              context: context, onStoreCreated: onStore2Created, lazy: lazy),
          _createStoreProvider<TStore3>(
              context: context, onStoreCreated: onStore3Created, lazy: lazy),
          _createStoreProvider<TStore4>(
              context: context, onStoreCreated: onStore4Created, lazy: lazy),
        ],
        child: child,
      ),
    );
  }
}

class StoreProvider5<
    TStore1 extends Store,
    TStore2 extends Store,
    TStore3 extends Store,
    TStore4 extends Store,
    TStore5 extends Store> extends StatelessWidget {
  final Widget child;
  final void Function(TStore1)? onStore1Created;
  final void Function(TStore2)? onStore2Created;
  final void Function(TStore3)? onStore3Created;
  final void Function(TStore4)? onStore4Created;
  final void Function(TStore5)? onStore5Created;
  final bool? lazy;

  const StoreProvider5({
    required this.child,
    this.onStore1Created,
    this.onStore2Created,
    this.onStore3Created,
    this.onStore4Created,
    this.onStore5Created,
    this.lazy,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) => MultiProvider(
        providers: [
          _createStoreProvider<TStore1>(
              context: context, onStoreCreated: onStore1Created, lazy: lazy),
          _createStoreProvider<TStore2>(
              context: context, onStoreCreated: onStore2Created, lazy: lazy),
          _createStoreProvider<TStore3>(
              context: context, onStoreCreated: onStore3Created, lazy: lazy),
          _createStoreProvider<TStore4>(
              context: context, onStoreCreated: onStore4Created, lazy: lazy),
          _createStoreProvider<TStore5>(
              context: context, onStoreCreated: onStore5Created, lazy: lazy),
        ],
        child: child,
      ),
    );
  }
}

class StoreProviderValue1<TStore extends Store> extends StatelessWidget {
  final Widget child;
  final TStore store;
  final void Function(TStore)? onStoreProvided;

  const StoreProviderValue1({
    required this.child,
    required this.store,
    this.onStoreProvided,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) => _provideStoreValue<TStore>(
        child: child,
        store: store,
        onStoreProvided: onStoreProvided,
      ),
    );
  }
}

class StoreProviderValue2<TStore1 extends Store, TStore2 extends Store>
    extends StatelessWidget {
  final Widget child;
  final TStore1 store1;
  final TStore2 store2;
  final void Function(TStore1)? onStore1Provided;
  final void Function(TStore2)? onStore2Provided;

  const StoreProviderValue2({
    required this.child,
    required this.store1,
    required this.store2,
    this.onStore1Provided,
    this.onStore2Provided,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) => MultiProvider(
        providers: [
          _provideStoreValue<TStore1>(
              store: store1, onStoreProvided: onStore1Provided),
          _provideStoreValue<TStore2>(
              store: store2, onStoreProvided: onStore2Provided),
        ],
        child: child,
      ),
    );
  }
}

Provider<TStore> _createStoreProvider<TStore extends Store>({
  required BuildContext context,
  void Function(TStore)? onStoreCreated,
  bool? lazy = true,
  Widget? child,
}) {
  return Provider(
    create: (BuildContext context) {
      final TStore store = getIt<TStore>();
      onStoreCreated?.call(store);
      return store;
    },
    lazy: lazy,
    child: child,
  );
}

Provider<TStore> _provideStoreValue<TStore extends Store>({
  required TStore store,
  Widget? child,
  void Function(TStore)? onStoreProvided,
}) {
  onStoreProvided?.call(store);
  return Provider.value(value: store, child: child);
}
