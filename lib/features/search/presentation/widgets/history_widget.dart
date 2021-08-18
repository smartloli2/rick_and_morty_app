import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/domain/entities/search_request.dart';
import 'package:rick_and_morty_app/features/search/logic/search_store.dart';

class HistoryWidget extends StatelessWidget {
  final List<SearchRequest> searchRequests;
  final TextEditingController textEditingController;

  const HistoryWidget({
    required this.searchRequests,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          spacing: 8.0,
          children: _buildSearchRequestChips(context),
        ),
      ),
    );
  }

  List<Widget> _buildSearchRequestChips(BuildContext context) {
    return searchRequests
        .map(
          (request) => GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              textEditingController.text = request.value;
              context.read<SearchStore>().showCharacters(request.value);
            },
            child: InputChip(
              label: Text(
                request.value,
                style: const TextStyle(fontSize: 20),
              ),
              elevation: 2.0,
              onDeleted: () {
                context.read<SearchStore>().deleteSearchRequest(request);
              },
            ),
          ),
        )
        .toList();
  }
}
