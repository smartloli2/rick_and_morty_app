import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/features/search/logic/search_store.dart';

class SearchInputFieldWidget extends HookWidget {
  final TextEditingController textEditingController;
  final FocusNode focusNode;

  const SearchInputFieldWidget({
    required this.textEditingController,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();

    return TextFormField(
      focusNode: focusNode,
      textInputAction: TextInputAction.done,
      cursorColor: Colors.grey[600],
      controller: textEditingController,
      autofocus: true,
      decoration: const InputDecoration(
        hintText: "Search...",
        border: InputBorder.none,
        // hintStyle: TextStyle(color: Colors.white30),
      ),
      style: const TextStyle(color: Colors.blue, fontSize: 20.0),
      onFieldSubmitted: (input) {
        focusNode.unfocus();
        context.read<SearchStore>()
          ..loadCharacters(input)
          ..saveSearchRequest(input);
      },
    );
  }
}
