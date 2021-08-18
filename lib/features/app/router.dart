import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/core/exceptions/route_exception.dart';
import 'package:rick_and_morty_app/core/log/i_log.dart';
import 'package:rick_and_morty_app/core/store_providers.dart';
import 'package:rick_and_morty_app/features/character_details/presentation/character_details_screen.dart';
import 'package:rick_and_morty_app/features/home/logic/recently_viewed_characters_store.dart';
import 'package:rick_and_morty_app/features/home/presentation/home_screen.dart';
import 'package:rick_and_morty_app/features/initialization/logic/initialization_store.dart';
import 'package:rick_and_morty_app/features/initialization/presentation/initialization_screen.dart';
import 'package:rick_and_morty_app/features/search/logic/search_store.dart';
import 'package:rick_and_morty_app/features/search/presentation/search_screen.dart';

class AppRouter {
  static const String initialRoute = '/';

  const AppRouter._();

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    log.debug('Navigate to ${settings.name} (App router)');

    return MaterialPageRoute(
      settings: settings,
      builder: (context) {
        switch (settings.name) {
          case AppRouter.initialRoute:
            return Provider(
              create: (context) => InitializationStore()..initializeApp(),
              lazy: false,
              child: const InitializationScreen(),
            );

          case HomeScreen.routeName:
            return StoreProvider1<RecentlyViewedCharactersStore>(
              onStoreCreated: (store) => store.loadWidget(),
              child: const HomeScreen(),
            );

          case SearchScreen.routeName:
            final args =
                _tryCastArgs<SearchScreenArguments>(settings.arguments);

            return StoreProvider1<SearchStore>(
              onStoreCreated: (store) => store.showSearchHistory(),
              child: SearchScreen(updateHome: args.updateHome),
            );

          case CharacterDetailScreen.routeName:
            final args =
                _tryCastArgs<CharacterDetailsArguments>(settings.arguments);
            return CharacterDetailScreen(character: args.character);

          default:
            log.error("Route ${settings.name} not found!");
            throw RouteException("Route ${settings.name} not found!");
        }
      },
    );
  }

  static T _tryCastArgs<T>(Object? arguments) {
    if (arguments is T) {
      return arguments;
    } else {
      log.error('Invalid type of navigation arguments: $T');
      throw InvalidNavArgumentsException(
        'Invalid type of navigation arguments: $T',
      );
    }
  }
}
