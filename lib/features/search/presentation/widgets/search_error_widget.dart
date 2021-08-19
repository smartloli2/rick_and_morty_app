import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/features/search/logic/search_store.dart';

class SearchErrorWidget extends StatelessWidget {
  final String? message;
  final TextEditingController textEditingController;

  const SearchErrorWidget({
    this.message,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              message ?? 'Something went wrong',
              style: const TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
          ),
          OutlinedButton(
            onPressed: () {
              final store = context.read<SearchStore>();
              store.loadCharacters(textEditingController.text);
            },
            child: const Text(
              'Retry',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
