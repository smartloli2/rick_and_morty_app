import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/core/widgets/loading_widget.dart';
import 'package:rick_and_morty_app/core/widgets/null_widget.dart';
import 'package:rick_and_morty_app/features/search/logic/search_store.dart';
import 'package:rick_and_morty_app/features/search/presentation/widgets/characters_list_widget.dart';
import 'package:rick_and_morty_app/features/search/presentation/widgets/history_widget.dart';
import 'package:rick_and_morty_app/features/search/presentation/widgets/search_error_widget.dart';

import 'widgets/search_input_field_widget.dart';

class SearchScreenArguments {
  final VoidCallback updateHome;

  const SearchScreenArguments({required this.updateHome});
}

class SearchScreen extends HookWidget {
  static const routeName = '/search';

  final VoidCallback? updateHome;

  const SearchScreen({this.updateHome});

  @override
  Widget build(BuildContext context) {
    final textEditingConroller = useTextEditingController();
    final focusNode = useFocusNode();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            final store = context.read<SearchStore>();
            final backToHistory = store.showSearchHistory;
            store.searchState.maybeMap(
              orElse: () => Navigator.pop(context),
              showResults: (_) => backToHistory.call(),
              loading: (_) => backToHistory.call(),
            );
            textEditingConroller.clear();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: SearchInputFieldWidget(
          textEditingController: textEditingConroller,
          focusNode: focusNode,
        ),
        actions: [
          IconButton(
            onPressed: () {
              textEditingConroller.clear();
            },
            icon: const Icon(Icons.close),
          )
        ],
      ),
      body: SafeArea(
        child: Observer(
          builder: (context) {
            final searchStore = context.read<SearchStore>();

            return searchStore.searchState.map(
              initial: (_) => const NullWidget(),
              loading: (_) => const LoadingWidget(),
              showHistory: (state) => HistoryWidget(
                searchRequests: state.searchRequests,
                textEditingController: textEditingConroller,
              ),
              showResults: (state) => CharactersListWidget(
                characters: state.characters,
                isLoadingMore: state.isLoadingMore,
                updateHome: updateHome,
              ),
              showError: (state) => SearchErrorWidget(
                message: state.message,
                textEditingController: textEditingConroller,
              ),
            );
          },
        ),
      ),
    );
  }
}
