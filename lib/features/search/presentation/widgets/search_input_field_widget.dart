import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/features/search/logic/search_store.dart';

class SearchInputFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;

  const SearchInputFieldWidget({
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
      onFieldSubmitted: (input) =>
          context.read<SearchStore>().getCharacters(input),
    );
  }
}
