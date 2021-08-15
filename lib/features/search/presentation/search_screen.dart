import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/core/widgets/loading_widget.dart';
import 'package:rick_and_morty_app/core/widgets/null_widget.dart';
import 'package:rick_and_morty_app/features/search/logic/search_store.dart';
import 'package:rick_and_morty_app/features/search/presentation/widgets/characters_list_widget.dart';

import 'widgets/search_input_field_widget.dart';

class SearchScreen extends HookWidget {
  static const routeName = '/search';

  const SearchScreen();

  @override
  Widget build(BuildContext context) {
    final textEditingConroller = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: SearchInputFieldWidget(
          textEditingController: textEditingConroller,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.close),
          )
        ],
      ),
      body: Observer(
        builder: (context) {
          final searchStore = context.read<SearchStore>();

          ///..
          return searchStore.state.map(
            initial: (_) => const NullWidget(),
            loading: (_) => const LoadingWidget(),
            loaded: (state) => CharactersListWidget(
              characters: state.characters,
            ),
          );
        },
      ),
    );
  }
}
